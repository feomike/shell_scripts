db=fccgis
schema=census2010

for i in *.shp.xml
do
x=${i%.shp}  #.xml
y=${x:6:2}
echo i is $i
echo x is $x
echo y is $y
#psql -p 54321 -h localhost $db -c 'DROP TABLE '$schema.$x
#shp2pgsql  -s 4326 -I -W latin1 -g geom $i $schema.$x $db | psql -p 54321 -h localhost $db
#psql -p 54321 -h localhost $db -c 'ALTER TABLE '$schema.$x' drop CONSTRAINT enforce_geotype_geom'
#psql -p 54321 -h localhost $db -c 'CREATE INDEX '$x'_geom_gist ON '$schema.$x' USING GIST(geom)'
#psql -p 54321 -h localhost $db -c 'UPDATE '$schema.$x' set geom = st_buffer(geom,0)'
#psql -p 54321 -h localhost $db -c 'select count(*) from '$schema.$x' where st_isvalid(geom) = true'
psql -p 54321 -h localhost $db -c 'DROP TABLE '$schema.'tract_'$y
done

echo "Today is $(date)"
