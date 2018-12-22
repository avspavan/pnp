#!/bin/bash

infs="--ninfs 50000"
comment="--comment 2.09rc2"
logfile="ncs2-2.09-rc2.txt"

echo "starting heavy networks now"

sleep 60s
timenow=`date`
echo $timenow
#goto1
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_vgg16hw_graph --preproc  vggTF --dim 224 --hw   $infs $comment 2>&1 | tee -a $logfile"
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_vgg16hw_graph --preproc vggTF --dim 224 --hw $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inception-resnet-v2hw_graph --preproc inception --hw --dim 299  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inception-resnet-v2hw_graph --preproc inception --hw --dim 299  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inceptionv4hw_graph --preproc  inception --hw --dim 299  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inceptionv4hw_graph --preproc inception --hw --dim 299  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_vgghw_graph --preproc  vggCaffe --dim 224 --hw    $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_vgghw_graph --preproc  vggCaffe --dim 224 --hw    $infs $comment 2>&1 | tee -a $logfile

sleep 60s
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inceptionv2hw_graph --preproc  inception --hw --dim 224  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inceptionv2hw_graph --preproc inception --hw --dim 224  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inceptionv3hw_graph --preproc  inception --hw --dim 299  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inceptionv3hw_graph --preproc inception --hw --dim 299  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
#wget -N https://github.intel.com/raw/vakkiset/tinyyolov2/master/ncs_tyv2.py
echo "python3 ./detection_nw_scripts/ncs_tyv2.py --ncsgraph ncs2graphs/tf_graphs/tf_tinyyolov2hw_graph --hw" 2>&1 | tee -a $logfile
python3 ./detection_nw_scripts/ncs_tyv2.py --ncsgraph ncs2graphs/tf_graphs/tf_tinyyolov2hw_graph --hw 2>&1 | tee -a $logfile
echo "python3 ./common/mapscripts/pascal_voc.py --resdir tyv2hwresults --obnet tf_tyv2hw"
python3 ./common/mapscripts/pascal_voc.py --resdir tyv2hwresults --obnet tf_tyv2hw

sleep 60s
#echo "python3 tensorflow_ncs/facenet/ncs_facenet.py --ncsgraph ncs2graphs/tf_graphs/tf_facenet_graph" 2>&1 | tee -a $logfile
#python3 tensorflow_ncs/facenet/ncs_facenet.py --ncsgraph ncs2graphs/tf_graphs/tf_facenet_graph  2>&1 | tee -a $logfile
timenow=`date`
echo $timenow
echo "python3 tensorflow_ncs/facenet/ncs_facenet.py --ncsgraph ncs2graphs/tf_graphs/tf_facenethw_graph --hw" 2>&1 | tee -a $logfile
python3 tensorflow_ncs/facenet/ncs_facenet.py --ncsgraph ncs2graphs/tf_graphs/tf_facenethw_graph --hw 2>&1 | tee -a $logfile


sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_cpu_ssdmobnet.py --ncsgraph ncs2graphs/caffe_graphs/hwgraphs/caffe_ssdmobilenethw_graph --hw" 2>&1 | tee -a $logfile
python3 ncs_cpu_ssdmobnet.py --ncsgraph ncs2graphs/caffe_graphs/hwgraphs/caffe_ssdmobilenethw_graph --hw 2>&1 | tee -a $logfile
echo "python3 ./common/mapscripts/pascal_voc.py --resdir ssdmobhwresults --obnet ssdmobhw"
python3 ./common/mapscripts/pascal_voc.py --resdir ssdmobhwresults --obnet ssdmobhw

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ./detection_nw_scripts/cpu_ncs2_tyv1.py --ncsgraph ncs2graphs/caffe_graphs/hwgraphs/caffe_tinyyolov1hw_graph --hw" 2>&1 | tee -a $logfile
python3 ./detection_nw_scripts/cpu_ncs2_tyv1.py --ncsgraph ncs2graphs/caffe_graphs/hwgraphs/caffe_tinyyolov1hw_graph --hw 2>&1 | tee -a $logfile
echo "python3 ./common/mapscripts/pascal_voc.py --resdir tyv1hwresults --obnet tf_tyv1hw"
python3 ./common/mapscripts/pascal_voc.py --resdir tyv1hwresults --obnet tyv1hw

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_160_graph --preproc  mobilenetv1 --hw --dim 160  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_160_graph --preproc mobilenetv1 --hw --dim 160  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_128_graph --preproc  mobilenetv1 --hw --dim 128  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_128_graph --preproc mobilenetv1 --hw --dim 128  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_224_graph --preproc  mobilenetv1 --hw --dim 224  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_224_graph --preproc  mobilenetv1 --hw --dim 224  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_192_graph --preproc  mobilenetv1 --hw --dim 192  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.25_192_graph --preproc  mobilenetv1 --hw --dim 192  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_160_graph --preproc  mobilenetv1 --hw --dim 160  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_160_graph --preproc  mobilenetv1 --hw --dim 160  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_128_graph --preproc  mobilenetv1 --hw --dim 128  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_128_graph --preproc  mobilenetv1 --hw --dim 128  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_224_graph --preproc  mobilenetv1 --hw --dim 224  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_224_graph --preproc mobilenetv1 --hw --dim 224  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_192_graph --preproc  mobilenetv1 --hw --dim 192  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.50_192_graph --preproc mobilenetv1 --hw --dim 192  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_160_graph --preproc  mobilenetv1 --hw --dim 160  $infs $comment 2>&1 | tee -a $logfile"
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_160_graph --preproc  mobilenetv1 --hw --dim 160  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_128_graph --preproc  mobilenetv1 --hw --dim 128  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_128_graph --preproc mobilenetv1 --hw --dim 128  $infs $comment 2>&1 | tee -a $logfile


sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_224_graph --preproc  mobilenetv1 --hw --dim 224  $infs $comment 2>&1 | tee -a $logfile"
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_224_graph --preproc  mobilenetv1 --hw --dim 224  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_192_graph --preproc  mobilenetv1 --hw --dim 192  $infs $comment 2>&1 | tee -a $logfile"
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_0.75_192_graph --preproc mobilenetv1 --hw --dim 192  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_160_graph --preproc  mobilenetv1 --hw --dim 160  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_160_graph --preproc mobilenetv1 --hw --dim 160  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_128_graph --preproc  mobilenetv1 --dim 128  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_128_graph --preproc  mobilenetv1 --hw --dim 128  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1_1.0_224_graph --preproc  mobilenetv1 --hw --dim 224  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_224_graph --preproc mobilenetv1 --hw --dim 224  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_192_graph --preproc  mobilenetv1 --hw --dim 192  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_mobilenetv1hw_1.0_192_graph --preproc mobilenetv1 --hw --dim 192  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_resnet50hw_graph --preproc  resnet --dim 224 --hw    $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_resnet50hw_graph --preproc resnet --dim 224 --hw $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inceptionv1hw_graph --preproc  inception --hw --dim 224  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/tf_graphs/tf_inceptionv1hw_graph --preproc inception --hw --dim 224  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_mobilenethw_graph --preproc  mobilenetv1 --dim 224 --hw    $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_mobilenethw_graph --preproc  mobilenetv1 --dim 224 --hw  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_resnet18hw_graph --preproc  resnet --dim 224 --hw  $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_resnet18hw_graph --preproc  resnet --dim 224 --hw    $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenethw_graph --preproc  googlenetv1 --dim 224 --hw    $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenethw_graph --preproc  googlenetv1 --dim 224 --hw  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenetMXhw_graph --preproc  googlenetv1 --dim 224 --hw    $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenetMXhw_graph --preproc  googlenetv1 --dim 224 --hw  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_squeezenethw_graph --preproc  squeezenet --dim 227 --hw    $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_squeezenethw_graph --preproc  squeezenet --dim 227 --hw  $infs $comment 2>&1 | tee -a $logfile

sleep 60s
timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenetv1hw_graph --preproc  googlenetv1 --dim 224  --hw   $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenetv1hw_graph --preproc  googlenetv1 --dim 224  --hw $infs $comment 2>&1 | tee -a $logfile


echo 'Starting Caffe Alexnet'

timenow=`date`
echo $timenow
echo "python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_alexnethw_graph --preproc  alexnet --dim 227 --hw   $infs $comment" 2>&1 | tee -a $logfile
python3 ncs_mtval.py --ncsgraph  ./ncs2graphs/caffe_graphs/hwgraphs/caffe_alexnethw_graph --preproc  alexnet --dim 227 --hw $infs $comment 2>&1 | tee -a $logfile


timenow=`date`
echo "END OF ACCURACY TEST - $timenow"
