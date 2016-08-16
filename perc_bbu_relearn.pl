#!/usr/bin/perl
$d=`MegaCli -AdpBbuCmd -aALL |grep "rn ti"|cut -f4 -d" "`;
print $d;
($sec,$min,$hour,$day,$month,$year)= localtime($d);
printf "%02d/%02d %02d:%02d:%02d\n", $month, $day, $hour, $min, $sec;
