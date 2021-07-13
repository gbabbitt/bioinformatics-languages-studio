#!/usr/bin/perl


# here is a Perl script that runs through each file in the 'YeastGene' folder
# and extracts the sequence, calculates GC content, and prints it out to a new folder

# please annotate the functioning code below
#...replacing the questions below with what you think the code right below it does

# what does this line do?.....makes new directory for output files
# This line makes a new file and if the file already exists it ends
# and then prints out a statement that says to try again.
#mkdir "ProcessedYeastG" or die "\nProcessedYeastG folder already exists. Delete it and try again.\n";
$filecount = 0;
$file_iteration = 0;

# what do these four variables represent? How are they used later in the code?
# Each heading stands for a different yeast group and later in the file set the headings
# are in front of each line in the file.
#$sp1_heading = "Scer";
#$sp2_heading = "Spar";
#$sp3_heading = "Smik";
#$sp4_heading = "Sbay";

mkdir 'ProcessedGenes';
# what does this part do?
# This opens the folder Yeast Genes and if there is an issue and it can't it prints out a statement
# it will print that the directory is open if it is able to open correctly.
$dir = "YeastGenes"; opendir(DIR,$dir) or die "can't open directory $dir:$!"; print"\n";
#print "Alignment files in $dir are:\n";

# what generally happens as result of the following while loop?
#This reads the directory and adds 1 to the filecount each time it loops through
while ($filename = readdir DIR){ # loop through alignment files
  #print "in first while loop\n";
  $ORFname = substr($filename, 0, 7);
  print "\nmy ORF name is "."$ORFname\n";
  $filelocation = "./YeastGenes/"."$filename";
  if (length $ORFname == 7){
    open(INFILE, $filelocation) or die "Cannot open file";
  }else {next;}
    open (OUTFILE, ">"."./ProcessedGenes/"."$filename") || die " could not open output file\n";
  
# this is another while loop nested in the previous while loop
#  what does it basically do?
# This is used to cut down on some of the extra spaces and characters 
  while(<INFILE>){
    #print "in counting while loop\n";
    chomp;
    my $totalCount = 0;
    my $CGCount = 0;
    my $DNA = <INFILE>;
    
    
    print($DNA . "\n");
    print OUTFILE ($DNA . "\n");
    #exit;
    my $position = 0;
    my $DNAsize = length($DNA);
    my $counter = 0;
    while($counter !=  $DNAsize){
      my $base = substr($DNA, $position, 1);
      #print $position . "position\n";
      #print($base . "base\n");
      if($base eq "A" || $base eq "T"  || $base eq "C"  ||  $base eq "G" ){
        #print($base . "base first condition\n");
        $totalCount++;
        #print($str . "\n");
        #print $totalCount . "total Count \n";
      }
      if($base eq "G" || $base eq "C"){
        #print($base . "base second condition\n");
        $CGCount++;
        #print $CGCount . "CG count\n";
      }
      #print "$CGCount";
      $position++;
      $counter++;
    }
    #print "out of part reading to eof\n";
print "countGC "."$ORFname\t"."$CGCount\n";
print "countTTL "."$ORFname\t"."$totalCount\n";
$freqGC = $CGCount/$totalCount;
print "freqGC "."$ORFname\t"."$freqGC\n";
print OUTFILE "countGC "."$ORFname\t"."$CGCount\n";
print OUTFILE "countTTL "."$ORFname\t"."$totalCount\n";
print OUTFILE "freqGC "."$ORFname\t"."$freqGC\n";
#sleep(1);
print "\n\n";
close OUTFILE;
close INFILE;
  }

} # end while loop
print "end program\n";
exit;