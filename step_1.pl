#===== perl script =======
# Read a list of Questions and Add 3 options for answer Yes/No/I dont know
#!/usr/bin/perl
    use strict;
    use warnings;
     
    my $filename = 'more.txt';
    my $x = 1;
    open(my $fh, $filename)
      or die "Could not open file '$filename' $!";
     
    while (my $row = <$fh>) {
      chomp $row;
      print "Q|L|".$x."| ".$row ."\n"."A|L|". $x ."| Yes "."\n"."A|L|".$x."| No \n".""."A|L|".$x."| Dont Know \n"."A|L|".$x."| Comment \n";
      $x++;
    }
    #print "done\n";
