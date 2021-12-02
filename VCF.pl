open (FH, "variants1.vcf")or die;
# open (FH, "combined_output-ALL.vcf")or die;
open (COMMON, ">common-test.txt")or die;
@data = <FH>;
push @headerArray, @data[0];
%hash = ();
foreach $entity (@headerArray)
{
	# print "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^","\n";
	@HeaderSplit = split ("\t", $entity);
	for ($i=1;$i<=$#data;$i++)
	{
		@ColIndex=();
		$CommonBoolean =TRUE;
		# print "*******************","\n";
		chomp $data[$i];
		@colsplit = split ("\t", $data[$i]);
		for ($k=9;$k<=$#colsplit;$k++)
		{
			print "###############","\n";
			chomp $colsplit[$k];
			@colonsplit = split (":", $colsplit[$k]);
			$sub = "1";
			if (index($colonsplit[0], $sub) == -1) ##1 is not present
			{
				$CommonBoolean = FALSE;
				print $CommonBoolean,"\n";
			}
			else
			{
				# print "ELSE " , $CommonBoolean,"\n";
				push @ColIndex, $k;
				$size = @ColIndex;
				# print "Size is " ,$size,"\n";
				# for ($l=0;$l<=$#ColIndex;$l++)
				# {
				# 	print "forrrrrrrrrrrr","\n";
				# 	chomp $ColIndex[$l];
				# 	print "index-col " , $ColIndex[$l],"\n";
				# 	print $k,"\n";
				# }

			}
			# if ($size > 1 and $CommonBoolean eq FALSE)
			# {
			# 	print "IF----1 " , "\n";
			# 	last;
			# }
			if ($k == $#colsplit and $CommonBoolean eq TRUE)
			{
				# print "IF----2 " , "\n";
				print COMMON @headerArray;
				print COMMON $data[$i],"\n";
				last;
			}
			if ($k == $#colsplit and $CommonBoolean eq FALSE and $size eq 1)
			{
				# print "IF----3 " , "\n";
				# print "index is " , @ColIndex,"\n";
				# print "variants in " , $HeaderSplit[$ColIndex[0]] ,"\n" , $data[$i],"\n";
				chomp $HeaderSplit[$ColIndex[0]];
				chomp $data[$i];
				push @{$hash{$HeaderSplit[$ColIndex[0]]}}, $data[$i];
				last;
			}
		}
	}
}
foreach $key (keys %hash)
{
	# chomp $@{$hash{$key}};
	print "$key","\n";
	# print "@{$hash{$key}}","\n";
	$FileName = Variants."."."$key".".".txt;
	print $FileName,"\n";
	open (OUT, ">$FileName")or die;
	print OUT @headerArray;
	print OUT join "\n" , @{$hash{$key}};
}