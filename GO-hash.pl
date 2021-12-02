open (FH1, "a.txt")or die;
open (FH2,"id.txt")or die;
@data1=<FH1>;
@data2=<FH2>;
%hash1;
%countHash;
foreach $key (@data1)
{
	chomp $key;
	@split = split ("\t", $key);
	# print $split[4],"\n";
	$key = $split[4];
	$value = $split[2];
	chomp $key;
	chomp $value;
	# print $value,"\n";
	$hash1{$key}=$value;
	foreach $element (@data2)
	{
		chomp $element;
		if ($element eq $key)
		{
			# print $element,"\n";
			push @match, $element,$value,"\n";
			print "match is " , @match,"\n";
		}
	}
foreach $key (keys %hash1)
{
	# print "$key:$hash1{$key}","\n";
	# print @match,"\n";
}
}