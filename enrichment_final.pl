use Math::Round;
#@entry=`cut -d"," -f1 output_atompairs.csv`;
#@entry=`cut -d"," -f1 output_atomtriplets.csv`;
#@entry=`cut -d"," -f1 output_dendritic.csv`;
#@entry=`cut -d"," -f1 output_linear.csv`;
#@entry=`cut -d"," -f1 output_molprints2d.csv`;
#@entry=`cut -d"," -f1 output_radial.csv`;
#@entry=`cut -d"," -f1 output_MAACS.csv`;
@entry=`cut -d"," -f1 output_topological.csv`;
@list=`cut -f1 94_actives_chembl_ids`;
#open OUT, (">Enrichment_atompairs.csv") or die;
#open OUT, (">Enrichment_atomtriplets.csv") or die;
#open OUT, (">Enrichment_denditic.csv") or die;
#open OUT, (">Enrichment_linear.csv") or die;
#open OUT, (">Enrichment_molprints.csv") or die;
#open OUT, (">Enrichment_radial.csv") or die;
#open OUT, (">Enrichment_structural_MACCS.csv") or die;
open OUT, (">Enrichment_topological.csv") or die;
#print @list;
$l=@entry;
$pi=$l*1/100;
my $p = round( $pi );
$p1=0;
$i=0;
$TP=0;
$total_actives = 94;
$TNFP=12302;
print OUT "%","\t","NOM", "\t", "TP","\t","FN","\t","TP+FN", "\t", "se","\t","FP", "\t","TN+FP", "\t", "TN","\t", "sp","\t","1-sp","\t","EF","\n";
for($i=0;$i<$l;$i=$i+$p)
{	
	#print $i,"\n";
	#print ($i+$p),"\n";
	#print "\n";
	#$TP=0;
	$p1=$p;
	#print "p1=$p1,\t",$p,"\n";
	for($j=$i;$j<$p1+$i;$j=$j+1)
	{
			#print "j=$j","\n";
			@match=grep(/@entry[$j]/,@list);
			$n=@match;
			#print "n=$n,\t", @match,"\n";
			$TP=$TP+$n;	
	}
	$FN = $total_actives-$TP;
	$se = $TP/($TP+$FN);
	$FP = ($i+$p)-$TP;
	$TN = ($TNFP)-$FP;
	$sp = $TN/($TN+$FP);
	$Nsp = 1-$sp;
	#$EF = $se/$Nsp;
	$FE1=$TP/($i+$p);
	#print $FE1,"\n";
	$FE2=$total_actives/$TNFP;
		#print $FE2,"\n";
	$EF=$FE1/$FE2;
	#$% = (($i+$p)/$l)*100;
	$a = $i+$p,"\n";
	$b = $l/100,"\n";
	$c = $a/$b,"\n";
	$per = round( $c );
	#$d=sprintf("%.4f",$per);
	print $per,"\n";
	
	print OUT "$per","\t", $i+$p, "\t", "$TP","\t","$FN","\t",$TP+$FN, "\t", $se, "\t", $FP, "\t", $TNFP, "\t", $TN, "\t", "$sp", "\t", $Nsp, "\t", $EF, "\n";
	}
