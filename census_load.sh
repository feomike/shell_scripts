#mydo.sh
#run post ftp all census block state files
#requires the following
#  - a postgis database and schema
#  - schema and tuncated tables for tract, county and state, water
#  - also requires that the census data is linked to previous block data
#    to obtain the right coastline; the nearshore flag was added by hand
#the script is driven (looped) by the list of .zips in the ./ directory
#
db=fccgis
schema=census2010
echo "Today is $(date)"

psql -p 54321 -h localhost $db -c 'truncate '$schema'.tracts'
psql -p 54321 -h localhost $db -c 'truncate '$schema'.county'
psql -p 54321 -h localhost $db -c 'truncate '$schema'.states'
psql -p 54321 -h localhost $db -c 'truncate '$schema'.water_poly'

rm *.shp
rm *.xml
rm *.dbf
rm *.prj
rm *.shx

for i in *.zip
do
#x=${i%.shp}  #.xml
y=${i:8:2}  #get the state fips id
echo i is $i
echo y is $y
unzip $i -d ./
psql -p 54321 -h localhost $db -c 'DROP TABLE 'analysis.working
shp2pgsql  -s 4269 -I -W latin1 -g geom $i analysis.working $db | psql -p 54321 -h localhost $db
psql -p 54321 -h localhost $db -c 'ALTER TABLE analysis.working OWNER TO postgres'
psql -p 54321 -h localhost $db -c 'DROP TABLE '$schema'.block_'$y
psql -p 54321 -h localhost $db -c 'create table '$schema'.block_'$y' as select gid, statefp10, countyfp10, tractce10, blockce10, geoid10, name10,mtfcc10, ur10, uace10, funcstat10, aland10, awater10, intptlat10,st_transform(geom,900913) as geom from analysis.working'
psql -p 54321 -h localhost $db -c 'alter table census2010.block_'$y' add CONSTRAINT carto_block_'$y'_pkey PRIMARY KEY (gid)'
psql -p 54321 -h localhost $db -c 'alter table census2010.block_'$y' add CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 2) '
psql -p 54321 -h localhost $db -c 'alter table census2010.block_'$y' add CONSTRAINT enforce_srid_geom CHECK (st_srid(geom) = 900913)'
psql -p 54321 -h localhost $db -c 'alter table census2010.block_'$y' set with oids'
psql -p 54321 -h localhost $db -c 'CREATE INDEX census2010_block_'$y'_geom_gist on census2010.block_'$y' using gist (geom)'
psql -p 54321 -h localhost $db -c 'CREATE INDEX census2010_block_'$y'_geoid10_gist on census2010.block_'$y' using btree (geoid10)'
psql -p 54321 -h localhost $db -c 'CREATE INDEX census2010_block_'$y'_gid_gist on census2010.block_'$y' using btree (gid)'
#update water and nearshore items
psql -p 54321 -h localhost $db -c 'alter table census2010.block_'$y' add column water smallint'
psql -p 54321 -h localhost $db -c 'alter table census2010.block_'$y' add column nearshore smallint'
psql -p 54321 -h localhost $db -c 'update census2010.block_'$y' set water = 1 where awater10 > aland10'
psql -p 54321 -h localhost $db -c 'update census2010.block_'$y' set nearshore = 0'
#prior to joining the table for water, make sure there is an index on geoid)
psql -p 54321 -h localhost $db -c 'CREATE INDEX carto_block_'$y'_geoid10_gist on carto.block_'$y' using btree (geoid10)'
psql -p 54321 -h localhost $db -c 'update census2010.block_'$y' set nearshore = 1 where geoid10 in (select geoid10 from carto.block_'$y' where nearshore = 1 order by geoid10)'
#perform the dissolve first tract, then county, then state; don't use a simplify for the tracts,
#because on county it created slivers
psql -p 54321 -h localhost $db -c 'insert into '$schema.'tracts SELECT ST_UNION(geom) as geom, substr(geoid10,1,11) as tract from '$schema.'block_'$y' where nearshore = 0 group by tract'
psql -p 54321 -h localhost $db -c 'insert into '$schema.'county SELECT st_simplify(ST_UNION(geom),1) as geom, substr(tract,1,5) as cty from '$schema.'tracts group by cty'
psql -p 54321 -h localhost $db -c 'insert into '$schema.'states SELECT st_simplify(ST_UNION(geom),2) as geom, substr(cty,1,2) as state from '$schema.'county group by state'
#create water_poly
psql -p 54321 -h localhost $db -c 'insert into census2010.water_poly select st_simplify(st_union(geom),5) as geom, statefp10 as state, nearshore, water from census2010.block_'$y' where water = 1 group by state, nearshore, water'

done

rm *.shp
rm *.xml
rm *.dbf
rm *.prj
rm *.shx
echo "Today is $(date)"

