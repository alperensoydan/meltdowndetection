#!/bin/bash

 pti_1=$(cat /boot/config-`uname -r` | grep CONFIG_PAGE_TABLE_ISOLATION= > a.txt)
 pti_1_1=$(cut -f 1 a.txt | tail -n +2 | head > pti_1_1.txt)
 pti_1_1_1=$(cat pti_1_1.txt)

 pti_2=$(cat /proc/cpuinfo | grep cpu_insecure > b.txt)
 pti_2_1=$(sort b.txt | uniq > c.txt)
 pti_2_2=$(cat c.txt)

 pti_3=$(dmesg | grep "Kernel/User page tables isolation: enabled" > d.txt)
 pti_3_1=$(cat d.txt)

if pti_1_1_1="CONFIG_PAGE_TABLE_ISOLATION=y" && pti_2_2="bugs           : cpu_insecure" && pti_3_1="[    0.000000] Kernel/User page tables isolation: enabled"
   then
 rm a.txt && rm pti_1_1.txt && rm b.txt && rm c.txt && rm d.txt && echo " System secure "
else
 rm a.txt && rm pti_1_1.txt && rm b.txt && rm c.txt && rm d.txt && echo " System unsecure "
fi
