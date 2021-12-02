open (FH,"diagonal.txt")or die;
@data = <FH>;

for ($i=0;$i<=$#data;$i++)
{
	chomp $data[$i];
	@split = split ("\t", $data[$i]);
	for ($j=0;$j<=$#split;$j++)
	{
		chomp $split[$j];
		$matrix[$i][$j] = $split[$j];
	}
}
for ($j=0;$j<=$#split;$j++)
{
	$sum = 0;$count=0;
	for ($i=0;$i<=$#data;$i++)
	{
		$sum += $matrix[$i][$j];
		$count++;
	}
	print "sum of each column is " , $sum,"\n";
	$average = $sum/$count;
	print "average of each column is " , $average,"\n";
}