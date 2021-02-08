    use strict;
    use warnings;
     
    my $filename = '6.txt';
    my $x = 1;
    open(my $fh, $filename)
      or die "Could not open file '$filename' $!";
     
    while (my $row = <$fh>) {
      chomp $row;
      print "Q|O|".$x."|".$row ."\n"."A|L|". $x ."|Yes"."\n"."A|L|".$x."|No\n".""."A|L|".$x."|Dont Know\n";
      $x++;
    }
    #print "done\n";
