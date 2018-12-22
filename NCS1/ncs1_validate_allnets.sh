#!/bin/bash
#:<<goto1
infs="--ninfs 50000"
comment="--comment 2.07rc2"
outfile="2.07rc2ncs1.txt"
wget https://github.intel.com/raw/vakkiset/NCS2/master/ncs_mtval.py
timenow=`date`

echo 'Starting Caffe Alexnet'

echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_alexnet_graph  --preproc  alexnet --dim 227   $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_alexnet_graph  --preproc  alexnet --dim 227   $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow

echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_squeezenet_graph  --preproc  squeezenet --dim 227  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_squeezenet_graph  --preproc  squeezenet --dim 227  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_googlenetv1_graph  --preproc  googlenetv1 --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_googlenetv1_graph  --preproc  googlenetv1 --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_mobilenet_graph  --preproc  mobilenetv1 --dim 224   $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_mobilenet_graph  --preproc  mobilenetv1 --dim 224   $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow

echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_resnet18_graph  --preproc  resnet --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_resnet18_graph  --preproc  resnet --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_resnet50_graph  --preproc  resnet --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_resnet50_graph  --preproc  resnet --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_vgg16_graph  --preproc  vggCaffe --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/caffe_graphs/caffe_vgg16_graph  --preproc  vggCaffe --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo $timenow
#goto1
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_vgg16_graph --preproc  vggTF --dim 224   $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_vgg16_graph --preproc  vggTF --dim 224   $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow

echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inception-resnet-v2_graph --preproc  inception --dim 299  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inception-resnet-v2_graph --preproc  inception --dim 299  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inceptionv1_graph --preproc  inception --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inceptionv1_graph --preproc  inception --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inceptionv2_graph --preproc  inception --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inceptionv2_graph --preproc  inception --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inceptionv3_graph --preproc  inception --dim 299  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inceptionv3_graph --preproc  inception --dim 299  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inceptionv4_graph --preproc  inception --dim 299  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_inceptionv4_graph --preproc  inception --dim 299  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
#:<< END
#goto
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_224_graph --preproc  mobilenetv1 --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_224_graph --preproc  mobilenetv1 --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_192_graph --preproc  mobilenetv1 --dim 192  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_192_graph --preproc  mobilenetv1 --dim 192  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_160_graph --preproc  mobilenetv1 --dim 160  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_160_graph --preproc  mobilenetv1 --dim 160  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_128_graph --preproc  mobilenetv1 --dim 128  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_1.0_128_graph --preproc  mobilenetv1 --dim 128  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_224_graph --preproc  mobilenetv1 --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_224_graph --preproc  mobilenetv1 --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_192_graph --preproc  mobilenetv1 --dim 192  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_192_graph --preproc  mobilenetv1 --dim 192  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_160_graph --preproc  mobilenetv1 --dim 160  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_160_graph --preproc  mobilenetv1 --dim 160  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_128_graph --preproc  mobilenetv1 --dim 128  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.75_128_graph --preproc  mobilenetv1 --dim 128  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_224_graph --preproc  mobilenetv1 --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_224_graph --preproc  mobilenetv1 --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_192_graph --preproc  mobilenetv1 --dim 192  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_192_graph --preproc  mobilenetv1 --dim 192  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_160_graph --preproc  mobilenetv1 --dim 160  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_160_graph --preproc  mobilenetv1 --dim 160  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_128_graph --preproc  mobilenetv1 --dim 128  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.50_128_graph --preproc  mobilenetv1 --dim 128  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_224_graph --preproc  mobilenetv1 --dim 224  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_224_graph --preproc  mobilenetv1 --dim 224  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_192_graph --preproc  mobilenetv1 --dim 192  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_192_graph --preproc  mobilenetv1 --dim 192  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_160_graph --preproc  mobilenetv1 --dim 160  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_160_graph --preproc  mobilenetv1 --dim 160  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_128_graph --preproc  mobilenetv1 --dim 128  $infs $comment" 2>&1 | tee -a $outfile
python3 ncs_mtval.py --ncsgraph  ./ncs1graphs/tf_graphs/tf_mobilenetv1_0.25_128_graph --preproc  mobilenetv1 --dim 128  $infs $comment 2>&1 | tee -a $outfile
timenow=`date`
echo $timenow

#END
wget -N https://github.intel.com/raw/vakkiset/mobilenet_ssd_demo/master/ncs_cpu_ssdmobnet.py
echo "python3 ncs_cpu_ssdmobnet.py --ncsgraph ncs1graphs/caffe_graphs/caffe_ssdmobilenet_graph"  2>&1 | tee -a $outfile
python3 ncs_cpu_ssdmobnet.py --ncsgraph ncs1graphs/caffe_graphs/caffe_ssdmobilenet_graph  2>&1 | tee -a $outfile
python3 ./common/mapscripts/pascal_voc.py --resdir ssdmobswresults --obnet ssdmobsw 2>&1 | tee -a $outfile
wget -N https://github.intel.com/raw/vakkiset/tinyyolov1_caffe/master/cpu_ncs_tyv1.py

echo "python3 cpu_ncs_tyv1.py --ncsgraph ncs1graphs/caffe_graphs/caffe_tinyyolov1_graph"  2>&1 | tee -a $outfile
python3 cpu_ncs_tyv1.py --ncsgraph ncs1graphs/caffe_graphs/caffe_tinyyolov1_graph  2>&1 | tee -a $outfile
python3 ./common/mapscripts/pascal_voc.py --resdir tyv1swresults --obnet tyv1sw 2>&1 | tee -a $outfile

wget -N https://github.intel.com/raw/vakkiset/tinyyolov2/master/ncs_tyv2.py
echo "python3 ncs_tyv2.py --ncsgraph ncs1graphs/tf_graphs/tf_tinyyolov2_graph"  2>&1 | tee -a $outfile
python3 ncs_tyv2.py --ncsgraph ncs1graphs/tf_graphs/tf_tinyyolov2_graph  2>&1 | tee -a $outfile
python3 ./common/mapscripts/pascal_voc.py --resdir tyv2swresults --obnet tf_tyv2sw 2>&1 | tee -a $outfile
echo "python3 tf_files/facenetfiles/ncs_facenet.py --ncsgraph ncs1graphs/tf_graphs/tf_facenet_graph --ncs1"  2>&1 | tee -a $outfile
python3 tf_files/facenetfiles/ncs_facenet.py --ncsgraph ncs1graphs/tf_graphs/tf_facenet_graph --ncs1  2>&1 | tee -a $outfile
