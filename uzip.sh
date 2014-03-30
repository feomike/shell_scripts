echo "Today is $(date)"

for i in *.zip
do
x=${i%.zip}  #.xml
y=${x:9:2}
echo i is $i
echo x is $x
echo y is $y
unzip $i -d ./
#psql -p 54321 -h localhost $db -c 'DROP TABLE '$schema.$x
done

echo "Today is $(date)"

