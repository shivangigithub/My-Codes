##problem1---multiple columns merge when same value
open (FH, "score2.csv")or die;
@data = <FH>;
$count=1;@column1 = ();@column2 = ();
%hash;@colarray1 = ();@colarray2 = ();@colarray3 = ();@mainArray = ();
@HashArray = ();
%hashcol1; %hashcol2;
for ($i=0;$i<=$#data;$i++)
{
	print "***************************","\n";
	chomp $data[$i];
	$col = $data[$i];
	@colsplit = split ("\t" , $data[$i]);
	# print "i ======== " , $i,"\n";
	# push (@mainArray, @colarray1, @colarray2, @colarray3);
		for ($j=0;$j<=$#colsplit;$j++)
		{
		print "================","\n";
		print "j is " , $j,"\n";
		chomp $colsplit[$j];
		$size = scalar @HashArray;
		print "size is " , $size,"\n";
			if ($j==0)
			{
			push @{$hashcol1{$j}}, $colsplit[$j];
			# $hash_ref = \%hash;
			if ($size < 1)
				{
					print "----------IF------------","\n";
					push (@HashArray, \%hashcol1);
				}
			}
			if ($j==1)
			{
				if ($size < 2)
				{
					print "----------IF-2------------","\n";
					push (@HashArray, \%hashcol2);
				}
			push @{$hashcol2{$j}}, $colsplit[$j];
			}
			print "hash array is ", @HashArray,"\n";
		}	
}
print "-------------------------------------------------------------------------------------","\n";
foreach $entity (@HashArray)
{
	print "GGGGGG","\n";
	print "entity is ", $entity,"\n";
	print "entity deref is " , %{$entity},"\n";
	# print "4444444444444444444444","\n";
	foreach $key (keys %{$entity})
	{
		print "4444444444444444444444","\n";
		print "&&&&&&&&&&&&&&&&&&&&","\n";
		@outputArray = @%{$entity{$key}};
		print "key is ", $key,"\n";
		# print "$key:@{$entity{$key}}","\n";
		push @outputArray, @{$entity{$key}};
		print "===================","\n";
		$count=1;
		$sum=0;

		for ($k=0;$k<=$#outputArray;$k++)
		{
			print "4444444444444444444444","\n";
			# print "$k", "$outputArray[$k]","\n";
			if ($outputArray[$k] > $outputArray[$k-1])
			{
				$count++;
			}
			push @{$hash2{$outputArray[$k]}}, $count;
		}
		foreach $key2 (keys %hash2)
		{
			$sum = 0;
			# print "^^^^^^^^^^^^^^^","\n";
			# print "KEY is " , "$key2","\n";
			push (@print1 , $key2);
			# print "VALUE IS " , "@{$hash2{$key2}}","\n";
			@AverageArray = @{$hash2{$key2}};
			for ($l=0;$l<=$#AverageArray;$l++)
			{
				# print "******************","\n";
				# print "rank is " , $AverageArray[$l],"\n";
				$sum += $AverageArray[$l];
				# print "sum is " ,  $sum,"\n";
				$size = scalar @AverageArray,"\n";
			}
			$avg = $sum/$size,"\n";
			print "average is " , $avg,"\n";
			print "$key2:@{$hash2{$key2}}:$avg","\n";
		}
	}
}