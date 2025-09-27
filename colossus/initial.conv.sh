#!/bin/bash

# outfile prefix
outprefix=initial
# code unit of mass (cgs)
massunitcgs=1.19929e+40
# code unit of mass (M_sun)
massunitmsun=6.02959e+06
# code unit of stellar mass (cgs)
mstarunitcgs=1.19929e+33
# code unit of stellar mass (M_Sun)
mstarunitmsun=0.602959
# code unit of length (cgs)
lengthunitcgs=6.1714e+18
# code unit of length (parsecs)
lengthunitparsec=2
# code unit of time (cgs)
timeunitcgs=4.7074e+17
# code unit of time (Myr)
timeunitsmyr=14917.2
# N-body  unit of time (cgs)
nbtimeunitcgs=5.4196e+11
# N-body unit of time (Myr)
nbtimeunitsmyr=0.017174

cat $outprefix.dyn.dat | grep -vE '^#' | awk '{print $1*'$timeunitsmyr', $8/$21}' > $outprefix.tmyr_rcrh.dat
prunedata.pl -d 30 $outprefix.tmyr_rcrh.dat > $outprefix.tmyr_rcrh-pruned.dat

cat $outprefix.dyn.dat | grep -vE '^#' | awk '{print $1*'$timeunitsmyr', $25/$21}' > $outprefix.tmyr_rcnbrh.dat
prunedata.pl -d 30 $outprefix.tmyr_rcnbrh.dat > $outprefix.tmyr_rcnbrh-pruned.dat

cat $outprefix.dyn.dat | grep -vE '^#' | awk '{print $1*'$timeunitsmyr', $7/(4.0/3.0*3.14159265*$8*'$lengthunitparsec')^3}' > $outprefix.tmyr_nc.dat
prunedata.pl -d 30 $outprefix.tmyr_nc.dat > $outprefix.tmyr_nc-pruned.dat

cat $outprefix.dyn.dat | grep -vE '^#' | awk '{print $1*'$timeunitsmyr', $5}' > $outprefix.tmyr_m.dat
prunedata.pl -d 30 $outprefix.tmyr_m.dat > $outprefix.tmyr_m-pruned.dat

cat $outprefix.bin.dat | grep -vE '^#' | awk '{print $1*'$timeunitsmyr', $11}' > $outprefix.tmyr_fbc.dat
prunedata.pl -d 30 $outprefix.tmyr_fbc.dat > $outprefix.tmyr_fbc-pruned.dat

cat $outprefix.bin.dat | grep -vE '^#' | awk '{print $1*'$timeunitsmyr', $12}' > $outprefix.tmyr_fb.dat
prunedata.pl -d 30 $outprefix.tmyr_fb.dat > $outprefix.tmyr_fb-pruned.dat

cat $outprefix.tmyr_nc.dat | awk '{print NR, $2}' > $outprefix.NR_nc.dat
cat $outprefix.tmyr_fbc.dat | awk '{print NR, $2}' > $outprefix.NR_fbc.dat
join $outprefix.NR_fbc.dat $outprefix.NR_nc.dat | awk '{print $2, $3}' > $outprefix.fbc_nc.dat
prunedata.pl -n 300 $outprefix.fbc_nc.dat > $outprefix.fbc_nc-pruned.dat
head -n 1 $outprefix.fbc_nc.dat > $outprefix.fbc_nc-arrow.dat
tail -n 1 $outprefix.fbc_nc.dat >> $outprefix.fbc_nc-arrow.dat
