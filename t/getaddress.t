# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl getaddress.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 1;
BEGIN { use_ok('getaddress') };

use Encode qw(from_to);
#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.
my $datafile = './data/QQWry.Dat';

my $str;
open my $fp, '<', 't/ip.txt' or die "Can't read the file: $!";
while (my $line = <$fp>)
{
	$line =~ s/^\s*//;
	$line =~ s/\s*$//;
	next unless ($line);
	$str = &ipwhere ($line, $datafile);
	warn from_to($str, "gbk", "utf8") . "\n";
}
close($fp);
