i = 0

while [ $i -lt 5 ]
do
	fortune > fortune.txt
	i = $(( i+1 ))
done

