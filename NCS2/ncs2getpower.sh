#!/bin/bash
#hw networks
#:<<goto1
# sw networks
comment="ncs2_rc2_"
ninfs=100
for execs in 2 1 
do
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenethw_graph --comment ${comment}${execs}  --hw --dim 224
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_alexnethw_graph --comment ${comment}${execs} --hw --dim 227
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_squeezenethw_graph --comment ${comment}${execs}  --hw --dim 227
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenetMXhw_graph --comment ${comment}${execs}  --hw --dim 224
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenetv1hw_graph  --comment ${comment}${execs} --hw --dim 224
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_mobilenethw_graph  --comment ${comment}${execs} --hw --dim 224
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_resnet18hw_graph --comment ${comment}${execs}  --hw --dim 224
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_resnet50hw_graph  --comment ${comment}${execs}  --hw  --dim 224
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_tinyyolov1hw3c_graph  --comment ${comment}${execs}  --hw --dim 448
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_tinyyolov1hw_graph --comment ${comment}${execs} --hw --dim 448
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_ssdmobilenethw_graph --comment ${comment}${execs} --hw --dim 300
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_vgghw_graph --comment ${comment}${execs} --hw --dim 224
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs}  --infs ${ninfs} --graph ./ncs2graphs/tf_graphs/tf_inceptionv1hw_graph --comment ${comment}${execs} --hw  --dim 224
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ./ncs2graphs/caffe_graphs/hwgraphs/caffe_ssdmobilenethw_graph --comment ${comment}${execs} --hw --dim 300
sleep 5s
echo " Starting Tensorflow network power measurements"
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_inceptionv1hw_graph --hw --dim 224 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_inceptionv2hw_graph --hw --dim 224 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_inceptionv3hw_graph --hw --dim 299 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --exe ${execs} --infs ${ninfs} --graph ncs2graphs/tf_graphs/tf_inceptionv4hw_graph --hw --dim 299 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_inception-resnet-v2hw_graph --hw --dim 299 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_224_graph --hw --dim 224 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_224_graph --hw --dim 224 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_224_graph --hw --dim 224 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_224_graph --hw --dim 224 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_192_graph --hw --dim 192 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_192_graph --hw --dim 192 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_192_graph --hw --dim 192 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_192_graph --hw --dim 192 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_160_graph --hw --dim 160 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_160_graph --hw --dim 160 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_160_graph --hw --dim 160 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_160_graph --hw --dim 160 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_128_graph --hw --dim 128 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_128_graph --hw --dim 128 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_128_graph --hw --dim 128 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_128_graph --hw --dim 128 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_facenethw_graph --hw --dim 160 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_vgg16hw_graph  --hw --dim 224 --comment ${comment}
sleep 5s
python3 power/powermeasure_msoon.py ncsdk_perf_power.py --infs ${ninfs} --exe ${execs} --graph ncs2graphs/tf_graphs/tf_tinyyolov2hw_graph --hw --dim 416 --comment ${comment}
sleep 5s
done

