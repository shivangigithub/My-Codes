#matrix transpose
open (FH, "transpose.txt")or die;
@data = <FH>;
for ($i=0;$i<=$#data;$i++)
{
	chomp $data[$i];
	@split = split ("\t", $data[$i]);
	for ($j=0;$j<=$#split;$j++)
	{
		$matrix[$i][$j] = $split[$j];
	}
}
for ($j=0;$j<=$#split;$j++)
{
	for ($i=0;$i<=$#data;$i++)
	{
		print $matrix[$i][$j],"\t";
	}
		print "\n";
}