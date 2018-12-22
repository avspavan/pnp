#!/bin/bash

ninfs=2000

#:<<'END1'
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_alexnet_graph --dim 227"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_alexnet_graph --dim 227
sleep 60s

echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_squeezenet_graph --dim 227"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_squeezenet_graph --dim 227

# INVALID TEST
#sleep 60s
#echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_squeezenet1.1_graph --dim 227"
#python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_squeezenet1.1_graph --dim 227

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_googlenetv1_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_googlenetv1_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_resnet18_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_resnet18_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_resnet50_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_resnet50_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_vgg16_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_vgg16_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_tinyyolov1_graph --dim 448"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_tinyyolov1_graph --dim 448

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --graph ./ncs1graphs/caffe_graphs/caffe_ssdmobilenet_graph --dim 300"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/caffe_graphs/caffe_ssdmobilenet_graph --dim 300

#tf networks

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inceptionv1_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inceptionv1_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inceptionv2_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inceptionv2_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inceptionv3_graph --dim 299"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inceptionv3_graph --dim 299

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inceptionv4_graph --dim 299"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inceptionv4_graph --dim 299
#END1

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inception-resnet-v2_graph --dim 299"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_inception-resnet-v2_graph --dim 299
#:<<'END2'

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_224_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_224_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_224_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_224_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_224_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_224_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_224_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_224_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_192_graph --dim 192"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_192_graph --dim 192

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_192_graph --dim 192"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_192_graph --dim 192

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_192_graph --dim 192"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_192_graph --dim 192

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_192_graph --dim 192"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_192_graph --dim 192

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_160_graph --dim 160"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_160_graph --dim 160

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_160_graph --dim 160"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_160_graph --dim 160

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_160_graph --dim 160"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_160_graph --dim 160

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_160_graph --dim 160"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_160_graph --dim 160

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_128_graph --dim 128"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_128_graph --dim 128

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_128_graph --dim 128"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_128_graph --dim 128

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_128_graph --dim 128"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_128_graph --dim 128

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_128_graph --dim 128"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_128_graph --dim 128
#END2

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_facenet_graph --dim 160"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_facenet_graph --dim 160

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_vgg16_graph --dim 224"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_vgg16_graph --dim 224

sleep 60s
echo "python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_tinyyolov2_graph --dim 416"
python3 ncsdk_perf.py --infs ${ninfs} --ncs1 --exe 1 --graph ncs1graphs/tf_graphs/tf_tinyyolov2_graph --dim 416
