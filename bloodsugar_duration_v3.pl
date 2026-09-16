#!/usr/bin/perl
use strict;
use warnings;
use open ':std', ':encoding(UTF-8)';
use utf8; # source is UTF-8
binmode STDOUT, ':utf8';

sub duration_seconds{
	my($tmp) = @_;  # args in @_
	chomp($tmp=`date -d "$tmp" +%s 2>/dev/null`);
	return $tmp;
}

#Read 2 days data from bloodsugar.md to @lines with $extralines printing
my$t=0;
my@lines;
my$extralines;
open my $fh, '<', 'bloodsugar.md' or die "Cannot open bloodsugar.md: $!";
foreach(reverse<$fh>){
	if(/(`\{\d\d:)|^(\d+?\. \d+?:\d+? \d+?mg\/dL.)|^(####)/ && $t<2){
		push@lines,$_ ;
		$t++ if /^####/;
	}elsif($t==2){
		$t++;
		next;
	}elsif($t==3){
		$extralines="$_";
		last;
	}
}
$_=$extralines;
s/    - `\{\d\d:\d\d /      {/g;
s/}`/}/g;
s/((<|>)(内|T|A))/\e[1;37;41m$1\e[0m/g;
print;

#Get @seconds and re-arrange lines
@lines=reverse@lines;
my$date;
my@seconds;
foreach(@lines){
	if(/^#### (\d+)(.+)/){#^#### 20260915Tue
		$date=$1;
	}
	if(/^(\d+?\.) (\d\d:\d\d) (\d+?mg\/dL.)/){#^1. 05:54 123mg/dL⁹
		$a=duration_seconds("$date $2");
		push@seconds,$a;
		$_="  $1 $2 $3 $a\n";#^  1. 05:54 123mg/dL⁹ 1789422840
	}
	if(/`\{(\d\d:\d\d) (.+?)\}`/){#^    -`{05:56 2½H<A}`
		$a=duration_seconds("$date $1");
		push@seconds,$a;
		$_="$1 {$2} $a\n";#^05:56 {2½H<A} 1789422960
	}
}

#@seconds -> @fixed_seconds -> @fixed_HM -> @lines~=s///;
my@fixed_seconds=@seconds;
my@fixed_HM;
foreach(0..$#seconds-1){$fixed_seconds[$_+1] += 86400 if $fixed_seconds[$_+1] -$fixed_seconds[$_] < 0;}
foreach(@fixed_seconds){
	$_=time()-$_;
	push@fixed_HM,sprintf("%02d:%02d",int($_ / 3600), int(($_ % 3600) / 60));
}
foreach (@lines) {
  for my$i(0..$#seconds) {
    s/\Q$seconds[$i]\E/$fixed_HM[$i]/;
  }
}

#Last highlight for long-term insulin and injection-site
foreach(@lines){
	s/((<|>)(内|T|A))/\e[1;37;41m$1\e[0m/g;
	if(/((T|I)(>|<))|(T|I)\e\[1;37;41m(>|<)/){
		s/(\{.+?\})/\e[1;4m$1\e[0m/;
		s/(\d\d:\d\d)$/\e[1;4m$1\e[0m/;
	}
}
print foreach @lines;print"\n";

__END__
