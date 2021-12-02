#/usr/bin/perl -w
open (FILE1, "3ERT_hits_1.sdf") or die "file not found";
@data=<FILE1>;
chomp @data;
$end=@data;
close FILE1;

open (FILE2, "ids_3ert_uniq") or die "file not found";
@hit=<FILE2>;
chomp @hit;
$total_comp=@hit;
close FILE2;

#Start a for loop using the bigger file. (sdf file)

for ($i=0;$i<$end;$i++)
{
	if ($data[$i] eq "\$\$\$\$") 
	{
	$a=$i+1;

#Iterate over the compounds list and find a match.

		for ($j=0;$j<$total_comp;$j++)
		{
#To avoid duplication
			unless (exists $seen_comp{$hit[$j]}) 
			{
				if ($hit[$j] eq $data[$a]) 

				{
#Add to the seen one so it can be skipped next.

				$seen_comp{$hit[$j]}=1;

					for ($k=$i;$k<$i+300;$k++)
					{
#Final printing of sdf file containing desired molecules.
					print "$data[$k]\n";

						if ($data[$k] eq "M  END") {last; }  

					}			
				}

			}
		}
	}
}

