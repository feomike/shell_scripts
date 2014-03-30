db=feomike
schema=census2009
echo "Today is $(date)"

for i in *.shp
do
x=${i%.shp}  #.xml
y=${x:6:2}
echo i is $i
echo x is $x
echo y is $y
psql -p 54321 -h localhost $db -c 'DROP TABLE '$schema.$x
shp2pgsql  -s 4326 -I -W latin1 -g geom $i $schema.$x $db | psql -p 54321 -h localhost $db
psql -p 54321 -h localhost $db -c 'ALTER TABLE '$schema.$x' drop CONSTRAINT enforce_geotype_geom'
psql -p 54321 -h localhost $db -c 'ALTER TABLE '$schema.$x' add column geoid09 character varying(15)'
psql -p 54321 -h localhost $db -c 'ALTER TABLE ' $schema.$x' OWNER TO postgres'
psql -p 54321 -h localhost $db -c 'UPDATE '$schema.$x' set geoid09 = statefp || countyfp || tractce00 || blockce00'
#psql -p 54321 -h localhost $db -c 'DROP INDEX '$x'_geom_gist '
#psql -p 54321 -h localhost $db -c 'CREATE INDEX '$x'_geom_gist ON '$schema.$x' USING GIST(geom)'
done

echo "Today is $(date)"

