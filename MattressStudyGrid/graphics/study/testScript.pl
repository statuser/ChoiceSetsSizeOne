use strict;
use warnings;

my $i = 1;
my $result = "";
for( my $taskNum = 1; $taskNum <= 12; $taskNum++) {
	for ( my $conceptNum = 1; $conceptNum <= 4; $conceptNum++) {
		my $conceptName = "Con" . $i;
		#my $att1 = CBCDESIGNLEVELTEXT ("CBCRandom" . taskNum, conceptNum, 1);
		#my $att2 = CBCDESIGNLEVELTEXT ("CBCRandom" . taskNum, conceptNum, 2);
		#my $att3 = CBCDESIGNLEVELTEXT ("CBCRandom" . taskNum, conceptNum, 3);
		#my $att4 = CBCDESIGNLEVELTEXT ("CBCRandom" . taskNum, conceptNum, 4);
		#my $att5 = CBCDESIGNLEVELTEXT ("CBCRandom" . taskNum, conceptNum, 5);
		#my $att6 = CBCDESIGNLEVELTEXT ("CBCRandom" . taskNum, conceptNum, 6);
		#my $att7 = CBCDESIGNLEVELTEXT ("CBCRandom" . taskNum, conceptNum, 7);
		my $att1 = "Attribute1";
		my $att2 = "Attribute2";
		my $att3 = "Attribute3";
		my $att4 = "Attribute4";
		my $att5 = "Attribute5";
		my $att6 = "Attribute6";
		my $att7 = "Attribute7";

		$result = $result . "<script type=\"text/javascript\">
		    				    const concept1 = new Concept(\"${conceptName}\",
			                                                 \"${att1}\", 
			                                                 \"${att2}\", 
			                                                 \"${att3}\", 
			                                                 \"${att4}\", 
			                                                 \"${att5}\",
			                                                 \"${att6}\",
			                                                 \"${att7}\");
			       			    concept1.createCard();
			       			</script>
			                <input name=\"CBCSwipe_${conceptName}\" id=\"CBCSwipe_${conceptName}\" type=\"hidden\" value=\"\">\n";
	}
}
					
print($result);
						