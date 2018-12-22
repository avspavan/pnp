#!/bin/bash
cd ./caffe_files/dssd/DSSD_Network
mvNCCompile -s 4 --nce-slices 4 --ma2480 dssd_deploy_my2_low_thresh.prototxt -w dssd_deploy_my2.caffemodel -o dssds4nce4
mvNCCompile -s 4 --nce-slices 6 --ma2480 dssd_deploy_my2_low_thresh.prototxt -w dssd_deploy_my2.caffemodel -o dssds4nce6
mvNCCompile -s 8 --nce-slices 8 --ma2480 dssd_deploy_my2_low_thresh.prototxt -w dssd_deploy_my2.caffemodel -o dssds8nce8

output_log="dssd_perf_test_result.log"

cd ../../../
timenow=`date`
echo "start time: $timenow" 2>&1 | tee -a $output_log

echo "python3 ncsdk_perf.py --exe 4 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds4nce4 --comment dssd_s4_nce4_2000infs_4threads --dim 192 --hw" 2>&1 | tee -a $output_log 
python3 ncsdk_perf.py --exe 4 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds4nce4 --comment dssd_s4_nce4_2000infs_4threads --dim 192 --hw 2>&1 | tee -a $output_log

sleep 10s
echo "python3 ncsdk_perf.py --exe 1 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds4nce4 --comment dssd_s4_nce4_2000infs_1threads --dim 192 --hw" 2>&1 | tee -a $output_log
python3 ncsdk_perf.py --exe 1 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds4nce4 --comment dssd_s4_nce4_2000infs_1threads --dim 192 --hw 2>&1 | tee -a $output_log

sleep 10s
echo "python3 ncsdk_perf.py --exe 3 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds4nce6 --comment dssd_s4_nce6_2000infs_3threads --dim 192 --hw" 2>&1 | tee -a $output_log
python3 ncsdk_perf.py --exe 3 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds4nce6 --comment dssd_s4_nce6_2000infs_3threads --dim 192 --hw 2>&1 | tee -a $output_log

sleep 10s
echo "python3 ncsdk_perf.py --exe 1 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds4nce6 --comment dssd_s4_nce6_2000infs_1threads --dim 192 --hw" 2>&1 | tee -a $output_log
python3 ncsdk_perf.py --exe 1 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds4nce6 --comment dssd_s4_nce6_2000infs_1threads --dim 192 --hw 2>&1 | tee -a $output_log

sleep 10s
echo "python3 ncsdk_perf.py --exe 2 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds8nce8 --comment dssd_s8_nce8_2000infs_2threads --dim 192 --hw" 2>&1 | tee -a $output_log
python3 ncsdk_perf.py --exe 2 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds8nce8 --comment dssd_s8_nce8_2000infs_2threads --dim 192 --hw 2>&1 | tee -a $output_log

sleep 10s
echo "python3 ncsdk_perf.py --exe 1 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds8nce8 --comment dssd_s8_nce8_2000infs_1threads --dim 192 --hw" 2>&1 | tee -a $output_log
python3 ncsdk_perf.py --exe 1 --infs 2000 --graph caffe_files/dssd/DSSD_Network/dssds8nce8 --comment dssd_s8_nce8_2000infs_1threads --dim 192 --hw 2>&1 | tee -a $output_log

timenow=`date`
echo "end-time: $timenow" 2>&1 | tee -a $output_log

