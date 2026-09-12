#!/usr/bin/perl
use strict;
use warnings;
use File::Basename qw(basename);
#use File::Copy qw(copy);

#wifi-debugging adb connect
# 1. Verify (no change)
`adb shell run-as juloo.keyboard2.debug ls -lh shared_prefs/pinned_clipboards.xml`;
# -rw-rw---- 1.2K ... pinned_clipboards.xml (original untouched)
# 2. Safe copy to world-readable tmp (not move)
`adb shell run-as juloo.keyboard2.debug cp shared_prefs/pinned_clipboards.xml /data/local/tmp/pinned.xml`;
`adb shell ls -lh /data/local/tmp/pinned.xml`;
# 3. Pull to x99 (your edit host)
`adb pull /data/local/tmp/pinned.xml ./tmp_pinned_clipboards.xml`;
print"Extracting to tmp_pinned_clipboards.xml\n";

my$lines="";
open my$fh, '<:encoding(UTF-8)', "tmp_pinned_clipboards.xml" or die "Cannot open: $!";
while(my $l=<$fh>){
	while($l =~ /(?<!\\)&quot;(.*?)(?<!\\)&quot;/g){
		$lines .= "$1\n";
	}
}
open my $fh2, '>:encoding(UTF-8)', './tmp.xml' or die "$!";
print $fh2 $lines;
close $fh2;
print"press Enter after editing ./tmp.xml\n";
<STDIN>;

my$line;
open my$fh3, '<:encoding(UTF-8)', "tmp.xml" or die "Cannot open: $!";
while(<$fh3>){
	chomp;
	$line.="&quot;${_}&quot;,"
}
chomp$line;
chop$line;
$line="<?xml version='1.0' encoding='utf-8' standalone='yes' ?>\n<map>\n    <string name=\"pinned\">[".$line."]</string>\n</map>";
print"$line\n";

open my $fh4, '>:encoding(UTF-8)', './tmp_2.xml' or die "$!";
print $fh4 $line;
close $fh4;
print"press Enter for writing\n";
<STDIN>;

`adb push ./tmp_2.xml /data/local/tmp/pinned.xml`;
`adb shell run-as juloo.keyboard2.debug cp /data/local/tmp/pinned.xml shared_prefs/pinned_clipboards.xml`;
`adb shell run-as juloo.keyboard2.debug chmod 600 shared_prefs/pinned_clipboards.xml && adb shell am force-stop juloo.keyboard2.debug`;
