#!/bin/bash
if [ "$1" = "ncs1" ]
then
sh ncs1_compile_caffegraphs.sh 2>&1| tee ncs1_caffecompile_check.txt
sh ncs1_compile_tfgraphs.sh  2>&1| tee ncs1_tfcompile_check.txt
sh ncs1getperf.sh
sh ncs1_validate_allnets.sh
fi

if [ "$1" = "ncs2" ]
then
sh ncs2_compile_caffegraphs.sh 2>&1| tee ncs2_caffecompile_check.txt
sh ncs2_compile_tfgraphs.sh  2>&1| tee ncs2_tfcompile_check.txt
sh ncs2getperf.sh
sh ncs2getdssdperf.sh
sh ncs2_validate_allnets.sh
fi
