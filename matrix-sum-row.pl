open (FH,"diagonal.txt")or die;
@data = <FH>;

for ($i=0;$i<=$#data;$i++)
{
	chomp $data[$i],"\n";
	@split = split ("\t", $data[$i]);
	for ($j=0;$j<=$#split;$j++)
	{
		chomp $split[$j];
		$matrix[$i][$j] = $split[$j];
	}
}
for ($i=0;$i<=$#data;$i++)
{
	$sum=0;$count=0;
	for ($j=0;$j<=$#split;$j++)
	{
		$sum += $matrix[$i][$j];
		$count++;
	}
	print "sum of each row " , $sum,"\n";
	$average = $sum/$count;
	print "averge of each row " , $average,"\n";
}