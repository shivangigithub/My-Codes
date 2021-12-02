$dir=("/Users/apple/Desktop/Programs-PhD/TCGA/dir/*/*");
open (FH1, "filename.txt") or die;
open (OUT, ">out2.txt") or die;

@data1 = <FH1>;
%hash;
push (@headerArray, "FILENAME \t"),"\n";
$IsExecuteFirstFile = 1;

foreach $file (glob($dir))
{
	open (FH, $file) or die;
	@textFileData = <FH>;
	print "==============","\n"; 
		# $IsExecuteFirstFile = 1;

		for ($i=0; $i<=$#textFileData;$i++)
		{
			chomp $textFileData[$i];
			# $IsExecuteFirstFile = 0;
			print "$i","\n";
			print "***************","\n"; 
			$textFileValue = $textFileData[$i];
			# $IsExecuxteFirstFile = 0;
			print "execute = " , $IsExecuteFirstFile,"\n";
			if ($IsExecuteFirstFile eq 1)
			{
				chomp $textFileValue;
				print "^^^^^^^^^^^^","\n"; 
				print "seeee","\n";
				# chomp @textFileDataArray;
				push (@textFileDataArray, $textFileValue . "\n");
				# print OUT @textFileDataArray;
			}
			else
			{
			print "%%%%%%%%%%%%%%%%","\n"; 
			# $IsExecuteFirstFile = 0;
			chomp $textFileData[$i];
			@splitLine = split ("\t", $textFileData[$i]);
			# chomp $splitLine[1];
			$textFileSplitValue = $splitLine[1];
			chomp $textFileSplitValue;
			chomp @textFileDataArray[$i];
			@textFileDataArray[$i] = @textFileDataArray[$i] . "\t". $textFileSplitValue;
			# print "$textFileSplitValue","\n";
			chomp @textFileDataArray[$i];
			# print OUT join "\n" , @textFileDataArray,"\n";
			# print OUT "\n";
			}
		}
		$IsExecuteFirstFile = 0;
}
		print OUT join "\n" , @textFileDataArray;

