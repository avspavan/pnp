#! /bin/bash

#cd `dirname $0`/../
echo "Starting the compilation of tf graphs"
rm -rf ncs1graphs/tf_graphs
rm -rf ncs1_tf_mvnccheckfiles
rm -rf tf_metafiles
mkdir -p ncs1graphs/tf_graphs
mkdir -p tf_metafiles
cd ./tf_files/Inceptions/
mkdir -p nets
wget -N https://raw.githubusercontent.com/tensorflow/models/master/research/slim/nets/inception_v1.py
wget -N https://raw.githubusercontent.com/tensorflow/models/master/research/slim/nets/inception_v2.py
wget -N https://raw.githubusercontent.com/tensorflow/models/master/research/slim/nets/inception_v3.py
wget -N https://raw.githubusercontent.com/tensorflow/models/master/research/slim/nets/inception_v4.py
wget -N https://raw.githubusercontent.com/tensorflow/models/master/research/slim/nets/inception_resnet_v2.py
wget -N https://raw.githubusercontent.com/tensorflow/models/master/research/slim/nets/inception_utils.py
mv inception_utils.py nets/
python3 inceptionv1_saver.py
python3 inceptionv2_saver.py
python3 inceptionv3_saver.py
python3 inceptionv4_saver.py
python3 inception-resnet-v2_saver.py
cd ../
python3 vgg16_saver.py
cd ./mobilenets/
wget -N https://raw.githubusercontent.com/tensorflow/models/master/research/slim/nets/mobilenet_v1.py
for CLASS in 0.25 0.50 0.75 1.0
do
  for SIZE in 128 160 192 224
  do
    echo "Creating mobilenet $CLASS $SIZE meta files"
    python3 mobilenets_saver.py ${CLASS} ${SIZE}
  done
done
python3 mobilenets_saver.py
cd ../../
echo "\n"
echo " **********creating inception v1 v2 v3 v4 graphs******************* "
mvNCCompile -s 12 tf_metafiles/inception-v1.meta -in=input -on=InceptionV1/Logits/Predictions/Reshape_1 -o ncs1graphs/tf_graphs/tf_inceptionv1_graph
echo "\n"
mvNCCompile -s 12 tf_metafiles/inception-v2.meta -in=input -on=Softmax -o ncs1graphs/tf_graphs/tf_inceptionv2_graph
echo "\n"
mvNCCompile -s 12 tf_metafiles/inception-v3.meta -in=input -on=InceptionV3/Predictions/Reshape_1 -o ncs1graphs/tf_graphs/tf_inceptionv3_graph
echo "\n"
mvNCCompile -s 12 tf_metafiles/inception-v4.meta -in=input -on=output -o ncs1graphs/tf_graphs/tf_inceptionv4_graph
echo "\n"
mvNCCompile -s 12 tf_metafiles/inception-resnet-v2.meta -in=input -on=output -o ncs1graphs/tf_graphs/tf_inception-resnet-v2_graph
echo "\n"

echo "\n"
echo "***********starting mobilenet compiling***************"
echo "\n"
for CLASS in 0.25 0.50 0.75 1.0
do
  for SIZE in 128 160 192 224
  do
    echo "Compiling mobilenet $CLASS $SIZE"
    echo "\n"
    mvNCCompile -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_${CLASS}_${SIZE}.meta -o ncs1graphs/tf_graphs/tf_mobilenetv1_${CLASS}_${SIZE}_graph
    echo "\n"
  done
done
echo "***********Completed mobilenet compiling***************"
echo "\n"
echo "\n"

mvNCCompile -s 12 -in=input -on=output tf_metafiles/vgg-16.meta -o ncs1graphs/tf_graphs/tf_vgg16_graph

# clone darkflow and install it
cd tf_files
git clone https://github.com/thtrieu/darkflow.git
cd darkflow
python3 setup.py build_ext --inplace
sed -i -e 's/python.*/python3/g' flow
./flow --model ../TinyYolov2/tiny-yolo-voc.cfg --load ../TinyYolov2/tiny-yolo-voc.weights --savepb
mv built_graph/tiny-yolo-voc.pb ../TinyYolov2/tiny-yolo-voc.pb
cd ../../

mvNCCompile -s 12 -in=input -on=output tf_files/TinyYolov2/tiny-yolo-voc.pb -o ncs1graphs/tf_graphs/tf_tinyyolov2_graph

echo "***** Starting Facenet Compiling***************************"
sleep 3
cd tf_files/facenetfiles
wget -N https://raw.githubusercontent.com/davidsandberg/facenet/master/src/models/inception_resnet_v1.py
wget -N https://github.intel.com/raw/vakkiset/NCS2/master/tensorflow_ncs/facenet/ncs_facenet.py
wget -N https://github.intel.com/raw/vakkiset/NCS2/master/tensorflow_ncs/facenet/pairs.txt
wget -N https://github.intel.com/raw/vakkiset/NCS2/master/tensorflow_ncs/facenet/facenet.py
python3 convert_facenet.py
cd ../../
mvNCCompile -s 12 tf_files/facenetfiles/output/facenet.meta -o ncs1graphs/tf_graphs/tf_facenet_graph

#:<<gohere
echo "**********mvNCChecks starting****************"
echo "\n"

echo "**********mvNCCheck Inception v1****************"
echo "\n"
mkdir -p ncs1_tf_mvnccheckfiles

mvNCCheck -s 12 tf_metafiles/inception-v1.meta -in=input -on=InceptionV1/Logits/Predictions/Reshape_1 -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/inceptionv1_mvnccheck.txt
echo "\n"
echo "\n"
sleep 3
echo "**********mvNCChecks Inception v2****************"
echo "\n"
mvNCCheck -s 12 tf_metafiles/inception-v2.meta -in=input -on=Softmax -i ./images/cat.jpg -id 283 -cs 0,1,2 -metric top1> ncs1_tf_mvnccheckfiles/inceptionv2_mvnccheck.txt
echo "\n"
echo "\n"
sleep 3
echo "**********mvNCChecks Inception v3****************"
echo "\n"
mvNCCheck -s 12 tf_metafiles/inception-v3.meta -in=input -on=InceptionV3/Predictions/Reshape_1 -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/inceptionv3_mvnccheck.txt
echo "\n"
echo "\n"
sleep 3
echo "**********mvNCChecks Inception v4****************"
echo "\n"
mvNCCheck -s 12 tf_metafiles/inception-v4.meta -in=input -on=output -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/inceptionv4_mvnccheck.txt
echo "\n"
echo "\n"
sleep 3
echo "**********mvNCChecks Inception Resnet v2****************"
echo "\n"
mvNCCheck -s 12 tf_metafiles/inception-resnet-v2.meta -in=input -on=output -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/inception-resnetv2_mvnccheck.txt
echo "\n"
echo "\n"
sleep 3
echo "**********mvNCChecks VGG 16****************"
mvNCCheck -s 12 -in=input -on=output tf_metafiles/vgg-16.meta -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 -cs 0,1,2 > ncs1_tf_mvnccheckfiles/vgg16_mvnccheck.txt
echo "\n"
echo "\n"
sleep 3
echo "tinyyolo v2 mvnc checks"
mvNCCheck -s 12 -in=input -on=output tf_files/TinyYolov2/tiny-yolo-voc.pb -metric accuracy_metrics> ncs1_tf_mvnccheckfiles/ncs1_tinyyolov2_mvnccheck.txt
sleep 3
echo "**********mvNCChecks Facenet****************"
echo "\n"
echo "\n"
mvNCCheck -s 12 tf_files/facenetfiles/output/facenet.meta -metric accuracy_metrics> ncs1_tf_mvnccheckfiles/ncs1_facenet_mvnccheck.txt
echo "\n"
echo "\n"
sleep 3

#echo before comment - commenting out tinyyolo and facenet as there is no easy way to do mvncchecks for these networks
#echo after the comment block


echo "**********starting mobilenet mvNCCheck***********"
echo "\n"

mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_224.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_1.0_224_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_192.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_1.0_192_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_160.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_1.0_160_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_1.0_128_mvnccheck.txt

mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_224.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.75_224_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_192.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.75_192_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_160.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.75_160_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.75_128_mvnccheck.txt

mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_224.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.50_224_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_192.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.50_192_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_160.meta -i ./images/cat.jpg -id 283 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.50_160_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.50_128_mvnccheck.txt

mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_224.meta -i ./images/cat.jpg -id 286 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.25_224_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_192.meta -i ./images/catmod.jpg -id 286 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.25_192_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_160.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.25_160_mvnccheck.txt
mvNCCheck -s 12 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 > ncs1_tf_mvnccheckfiles/mobilenetv1_0.25_128_mvnccheck.txt

#gohere
