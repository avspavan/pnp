#! /bin/bash
#cd `dirname $0`/../
echo "Starting the compilation of tf graphs"
rm -rf ncs2graphs/tf_graphs
rm -rf tf_metafiles
mkdir -p ncs2graphs/tf_graphs
mkdir -p tf_metafiles
cd ./tf_files/Inceptions/
mkdir -p nets
#wget https://github.com/tensorflow/models/blob/master/research/slim/nets/inception_v1.py
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
echo "mvNCCompile -s 4  -i images/cat.jpg tf_metafiles/inception-v1.meta -in=input -on=InceptionV1/Logits/Predictions/Reshape_1 -o ncs2graphs/tf_graphs/tf_inceptionv1hw_graph --ma2480"
mvNCCompile -s 4  tf_metafiles/inception-v1.meta -in=input -on=InceptionV1/Logits/Predictions/Reshape_1 -o ncs2graphs/tf_graphs/tf_inceptionv1hw_graph --ma2480 
#mvNCCompile -s 16  -i images/cat.jpg tf_metafiles/inception-v1.meta -in=input -on=InceptionV1/Logits/Predictions/Reshape_1 -o ncs2graphs/tf_graphs/tf_inceptionv1_graph 

echo "\n"
echo "mvNCCompile -s 4 tf_metafiles/inception-v2.meta -in=input -on=Softmax --ma2480 -o ncs2graphs/tf_graphs/tf_inceptionv2hw_graph"
mvNCCompile -s 4 tf_metafiles/inception-v2.meta -in=input -on=Softmax --ma2480  --accuracy_adjust="ALL:256" -o ncs2graphs/tf_graphs/tf_inceptionv2hw_graph
#echo "\n"
#mvNCCompile -s 16 tf_metafiles/inception-v2.meta -in=input -on=Softmax  -o ncs2graphs/tf_graphs/tf_inceptionv2_graph 

echo "\n"
mvNCCompile -s 4 tf_metafiles/inception-v3.meta -in=input -on=InceptionV3/Predictions/Reshape_1 --ma2480   -o ncs2graphs/tf_graphs/tf_inceptionv3hw_graph
#echo "\n"
#mvNCCompile -s 16 tf_metafiles/inception-v3.meta -in=input -on=InceptionV3/Predictions/Reshape_1  -o ncs2graphs/tf_graphs/tf_inceptionv3_graph

echo "\n"
mvNCCompile -s 4 tf_metafiles/inception-v4.meta -in=input -on=output --ma2480  -o ncs2graphs/tf_graphs/tf_inceptionv4hw_graph 
#echo "\n"
#mvNCCompile -s 16 tf_metafiles/inception-v4.meta -in=input -on=output  -o ncs2graphs/tf_graphs/tf_inceptionv4_graph

echo "\n"
mvNCCompile -s 4 tf_metafiles/inception-resnet-v2.meta -in=input -on=output --ma2480  -o ncs2graphs/tf_graphs/tf_inception-resnet-v2hw_graph
#echo "\n"
#mvNCCompile -s 16 tf_metafiles/inception-resnet-v2.meta -in=input -on=output  -o ncs2graphs/tf_graphs/tf_inception-resnet-v2_graph

echo "\n"
echo "***********starting mobilenet compiling***************"
echo "\n"
for CLASS in 0.25 0.50 0.75 1.0
do
  for SIZE in 128 160 192 224
  do
    echo "Compiling mobilenet $CLASS $SIZE"
    echo "\n"
    if [ $CLASS = 1.0 ] && [ $Size = 224 ]
    then
        mvNCCompile -s 4 -in=input   -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_${CLASS}_${SIZE}.meta --ma2480  -o ncs2graphs/tf_graphs/tf_mobilenetv1hw_${CLASS}_${SIZE}_graph
    else
        mvNCCompile -s 4 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_${CLASS}_${SIZE}.meta --ma2480  -o ncs2graphs/tf_graphs/tf_mobilenetv1hw_${CLASS}_${SIZE}_graph
#    mvNCCompile -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_${CLASS}_${SIZE}.meta  -o ncs2graphs/tf_graphs/tf_mobilenetv1_${CLASS}_${SIZE}_graph
     fi
     echo "\n" 
  done
done
echo "***********Completed mobilenet compiling***************"
echo "\n"
echo "\n"

#mvNCCompile -s 4 -i images/cat.jpg  -in=input -on=output tf_metafiles/vgg-16.meta -o ncs2graphs/tf_graphs/tf_vgg16hw_graph --ma2480
mvNCCompile -s 4 -in=input -on=output tf_metafiles/vgg-16.meta -o ncs2graphs/tf_graphs/tf_vgg16hw_graph --ma2480
#mvNCCompile -s 16 -i images/cat.jpg  -in=input -on=output tf_metafiles/vgg-16.meta -o ncs2graphs/tf_graphs/tf_vgg16_graph 

# clone darkflow and install it
cd tf_files
git clone https://github.com/thtrieu/darkflow.git
cd darkflow
python3 setup.py build_ext --inplace
sed -i -e 's/python.*/python3/g' flow
./flow --model ../TinyYolov2/tiny-yolo-voc.cfg --load ../TinyYolov2/tiny-yolo-voc.weights --savepb
mv built_graph/tiny-yolo-voc.pb ../TinyYolov2/tiny-yolo-voc.pb
cd ../../

mvNCCompile -s 4   -in=input -on=output tf_files/TinyYolov2/tiny-yolo-voc.pb --ma2480  -o ncs2graphs/tf_graphs/tf_tinyyolov2hw_graph
#mvNCCompile -s 16 -in=input -on=output tf_files/TinyYolov2/tiny-yolo-voc.pb  -o ncs2graphs/tf_graphs/tf_tinyyolov2_graph

echo "***** Starting Facenet Compiling***************************"
sleep 3
cd tf_files/facenetfiles
wget -N https://raw.githubusercontent.com/davidsandberg/facenet/master/src/models/inception_resnet_v1.py
wget -N https://github.intel.com/raw/vakkiset/NCS2/master/tensorflow_ncs/facenet/ncs_facenet.py
wget -N https://github.intel.com/raw/vakkiset/NCS2/master/tensorflow_ncs/facenet/pairs.txt
wget -N https://github.intel.com/raw/vakkiset/NCS2/master/tensorflow_ncs/facenet/facenet.py
python3 convert_facenet.py
cd ../../
mvNCCompile -s 4 tf_files/facenetfiles/output/facenet.meta --ma2480  -o ncs2graphs/tf_graphs/tf_facenethw_graph
#mvNCCompile -s 16 tf_files/facenetfiles/output/facenet.meta  -o ncs2graphs/tf_graphs/tf_facenet_graph
#:<< 'END'

echo "**********mvNCChecks starting****************"
echo "\n"

echo "**********mvNCCheck Inception v1****************"
echo "\n"
rm -rf ncs2_tf_mvnccheckfiles
mkdir -p ncs2_tf_mvnccheckfiles

mvNCCheck -s 4 tf_metafiles/inception-v1.meta -in=input -on=InceptionV1/Logits/Predictions/Reshape_1 -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/inceptionv1hw_mvnccheck.txt
#mvNCCheck -s 16 tf_metafiles/inception-v1.meta -in=input -on=InceptionV1/Logits/Predictions/Reshape_1 -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/inceptionv1_mvnccheck.txt

echo "\n"
echo "\n"
sleep 3
echo "**********mvNCChecks Inception v2****************"
echo "\n"
mvNCCheck -s 4 tf_metafiles/inception-v2.meta -in=input -on=Softmax -i ./images/cat.jpg -id 283 -cs 0,1,2 -metric top1 --ma2480   > ncs2_tf_mvnccheckfiles/inceptionv2hw_mvnccheck.txt
#mvNCCheck -s 16 tf_metafiles/inception-v2.meta -in=input -on=Softmax -i ./images/cat.jpg -id 283 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/inceptionv2_mvnccheck.txt
echo "\n"
echo "\n"
sleep 3
echo "**********mvNCChecks Inception v3****************"
echo "\n"
mvNCCheck -s 4 tf_metafiles/inception-v3.meta -in=input -on=InceptionV3/Predictions/Reshape_1 -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  --ma2480  > ncs2_tf_mvnccheckfiles/inceptionv3hw_mvnccheck.txt
echo "\n"
#mvNCCheck -s 16 tf_metafiles/inception-v3.meta -in=input -on=InceptionV3/Predictions/Reshape_1 -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/inceptionv3_mvnccheck.txt
echo "\n"
sleep 3
echo "**********mvNCChecks Inception v4****************"
echo "\n"
mvNCCheck -s 4 tf_metafiles/inception-v4.meta -in=input -on=output -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/inceptionv4hw_mvnccheck.txt
echo "\n"
#mvNCCheck -s 16 tf_metafiles/inception-v4.meta -in=input -on=output -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1   > ncs2_tf_mvnccheckfiles/inceptionv4_mvnccheck.txt
echo "\n"
sleep 3
echo "**********mvNCChecks Inception Resnet v2****************"
echo "\n"
mvNCCheck -s 4 tf_metafiles/inception-resnet-v2.meta -in=input -on=output -i ./images/cat.jpg -id 282 -cs 0,1,2 --ma2480  -metric top1 > ncs2_tf_mvnccheckfiles/inception-resnetv2hw_mvnccheck.txt
echo "\n"
#mvNCCheck -s 16 tf_metafiles/inception-resnet-v2.meta -in=input -on=output -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/inception-resnetv2_mvnccheck.txt
echo "\n"
sleep 3
echo "**********mvNCChecks VGG 16****************"
mvNCCheck -s 4 -in=input -on=output tf_metafiles/vgg-16.meta -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 -cs 0,1,2 --ma2480  > ncs2_tf_mvnccheckfiles/vgg16hw_mvnccheck.txt
echo "\n"
#mvNCCheck -s 16 -in=input -on=output tf_metafiles/vgg-16.meta -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 -cs 0,1,2  > ncs2_tf_mvnccheckfiles/vgg16_mvnccheck.txt
echo "\n"
sleep 3
echo "**********mvNCChecks Tiny Yolo V2****************"
echo "\n"
mvNCCheck -s 4 -in=input -on=output    tf_files/TinyYolov2/tiny-yolo-voc.pb -metric accuracy_metrics --ma2480  > ncs2_tf_mvnccheckfiles/tinyyolov2hw_mvnccheck.txt
echo "\n"
#mvNCCheck -s 16 -in=input -on=output tf_files/TinyYolov2/tiny-yolo-voc.pb -metric accuracy_metrics  > ncs2_tf_mvnccheckfiles/tinyyolov2_mvnccheck.txt
echo "\n"
sleep 3
echo "**********mvNCChecks Facenet****************"
echo "\n"
mvNCCheck -s 4 tf_files/facenetfiles/output/facenet.meta -metric accuracy_metrics --ma2480  > ncs2_tf_mvnccheckfiles/facenethw_mvnccheck.txt
echo "\n"
echo "\n"
sleep 3


echo "**********starting mobilenet mvNCCheck***********"
echo "\n"

mvNCCheck -s 4 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_224.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480   > ncs2_tf_mvnccheckfiles/mobilenetv1hw_1.0_224_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_224.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_1.0_224_mvnccheck.txt


mvNCCheck -s 4    -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_192.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1_1.0_192hw_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_192.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_1.0_192_mvnccheck.txt

mvNCCheck -s 4    -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_160.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_1.0_160_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_160.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_1.0_160_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_1.0_128_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_1.0_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_1.0_128_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_224.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.75_224_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_224.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.75_224_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_192.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.75_192_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_192.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.75_192_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_160.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.75_160_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_160.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.75_160_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.75_128_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.75_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.75_128_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_224.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.50_224_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_224.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1   > ncs2_tf_mvnccheckfiles/mobilenetv1_0.50_224_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_192.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.50_192_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_192.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.50_192_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_160.meta -i ./images/cat.jpg -id 283 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.50_160_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_160.meta -i ./images/cat.jpg -id 283 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.50_160_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.50_128_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.50_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.50_128_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_224.meta -i ./images/cat.jpg -id 286 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.25_224_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_224.meta -i ./images/cat.jpg -id 286 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.25_224_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_192.meta -i ./images/catmod.jpg -id 286 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.25_192_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_192.meta -i ./images/catmod.jpg -id 286 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.25_192_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_160.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.25_160_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_160.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.25_160_mvnccheck.txt

mvNCCheck -s 4   -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1 --ma2480  > ncs2_tf_mvnccheckfiles/mobilenetv1hw_0.25_128_mvnccheck.txt
#mvNCCheck -s 16 -in=input -on=MobilenetV1/Predictions/Softmax tf_metafiles/mobilenet_v1_0.25_128.meta -i ./images/cat.jpg -id 282 -cs 0,1,2 -metric top1  > ncs2_tf_mvnccheckfiles/mobilenetv1_0.25_128_mvnccheck.txt


#END
