open (FH, "formulat1.txt")or die;
@data = <FH>;
@mainArray=();
%innerhash=();
for ($i=0;$i<=$#data;$i++)
{
	%innerhash=();
	$molwtOxygen=0;$molwtHydrogen=0;$molwtIron=0;
	chomp $data[$i];
	@element = split ("", $data[$i]);
	for ($j=0;$j<=$#element;$j++)
	{
		if ($element[$j]/1 ne $element[$j])
		{
			$value = $element[$j+1];
			if ($value/1 eq $value)
			{
				$value = $element[$j+1];
			}
			else
			{
				$value = 1;
			}
			if (exists $innerhash{$element[$j]})
			{
				$value = $innerhash{$element[$j]};
				$value = $value+1;
				$innerhash{$element[$j]} = $value;
			}
			else
			{
				$innerhash{$element[$j]} = $value;
			}
		}
			@mainArray[$i] = \%innerhash;
	}
	#if for loop closes here, then array retains only last value, ask it
	for ($k=0;$k<=$#mainArray;$k++)
	{
		$href = $mainArray[$k];
		for $key ( keys %$href ) #%{$href} #also we can write as this
		{ 
			# print "$key=$href->{$key}", "\n"; 
			if ($key eq "O")
			{
				$molwtOxygen = (16 * $href->{$key});
				# print $molwtOxygen,"\n";
			}
			if ($key eq "H")
			{
				$molwtHydrogen = (1 * $href->{$key});
				# print $molwtHydrogen,"\n";
			}
			if ($key eq "F")
			{
				$molwtIron = (14 * $href->{$key});
				# print $molwtIron,"\n";
			}
		}
		$TotalMolWt = $molwtOxygen+$molwtHydrogen+$molwtIron;
		print "mol-wt $data[$i] is ", $TotalMolWt,"\n";
		last;
	}
}