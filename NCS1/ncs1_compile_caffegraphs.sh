#! /bin/bash

echo "Starting NCS1 caffe graph compiling"
rm -rf ncs1graphs
rm -rf ncs1_caffe_mvnccheckfiles
mkdir -p ncs1graphs
mkdir -p ncs1graphs/caffe_graphs
mkdir -p ncs1_caffe_mvnccheckfiles
cd caffe_files
echo 'compiling Alexnet'
mvNCCompile -s 12 Alexnet_deploy.prototxt -w bvlc_alexnet.caffemodel -o ../ncs1graphs/caffe_graphs/caffe_alexnet_graph
echo 'compiling googlenetv1'
mvNCCompile -s 12 googlenetv1_deploy.prototxt -w bvlc_googlenet.caffemodel -o ../ncs1graphs/caffe_graphs/caffe_googlenetv1_graph
echo 'compiling squeezenet'
mvNCCompile -s 12 squeezenet_deploy.prototxt -w squeezenet_v1.0.caffemodel -o ../ncs1graphs/caffe_graphs/caffe_squeezenet_graph
echo 'compiling resnet18'
mvNCCompile -s 12 resnet18_2.prototxt -w resnet-18.caffemodel -o ../ncs1graphs/caffe_graphs/caffe_resnet18_graph
echo 'compiling resnet-50'
mvNCCompile -s 12 ResNet-50-deploy.prototxt -w ResNet-50-model.caffemodel -o ../ncs1graphs/caffe_graphs/caffe_resnet50_graph
echo 'compiling vgg16'
mvNCCompile -s 12 VGG_ILSVRC_16_layers_deploy.prototxt -w VGG_ILSVRC_16_layers.caffemodel -o ../ncs1graphs/caffe_graphs/caffe_vgg16_graph
echo 'compiling tinyyolov1'
mvNCCompile -s 12 tiny-yolo-v1.prototxt -w tiny-yolo-v1_53000.caffemodel -o ../ncs1graphs/caffe_graphs/caffe_tinyyolov1_graph
echo 'compiling ssd mobilenet'
mvNCCompile -s 12 MobileNetSSD_deploy.prototxt -w MobileNetSSD_deploy.caffemodel -o ../ncs1graphs/caffe_graphs/caffe_ssdmobilenet_graph

echo "Completed compiling Caffe NCS graphs"
sleep 3
cd ..
echo "\n"
echo "mvNCCheck -s 12 caffe_files/Alexnet_deploy.prototxt -w caffe_files/bvlc_alexnet.caffemodel -i ./images/cat.jpg -s 12 -id 281 -M 110 -S 255 -metric top1 > ./ncs1_caffe_mvnccheckfiles/alexnet_mvnccheck.txt"
mvNCCheck -s 12 caffe_files/Alexnet_deploy.prototxt -w caffe_files/bvlc_alexnet.caffemodel -i ./images/cat.jpg -s 12 -id 281 -M 120 -S 255 -metric top1 > ./ncs1_caffe_mvnccheckfiles/alexnet_mvnccheck.txt
sleep 3
echo "\n"
echo "mvNCCheck -s 12 caffe_files/googlenetv1_deploy.prototxt -w caffe_files/bvlc_googlenet.caffemodel -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 > ncs1_caffe_mvnccheckfiles/googlenetv1_mvnccheck.txt"
mvNCCheck -s 12 caffe_files/googlenetv1_deploy.prototxt -w caffe_files/bvlc_googlenet.caffemodel -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 > ncs1_caffe_mvnccheckfiles/googlenetv1_mvnccheck.txt
sleep 3
echo "\n"
echo "mvNCCheck -s 12 caffe_files/squeezenet_deploy.prototxt -w caffe_files/squeezenet_v1.0.caffemodel -i ./images/cat.jpg -id 281 -S 255 -M 120 -metric top1 > ncs1_caffe_mvnccheckfiles/squeezenet_mvnccheck.txt"
mvNCCheck -s 12 caffe_files/squeezenet_deploy.prototxt -w caffe_files/squeezenet_v1.0.caffemodel -i ./images/cat.jpg -id 281 -S 255 -M 120 -metric top1 > ncs1_caffe_mvnccheckfiles/squeezenet_mvnccheck.txt
sleep 3
echo "\n"
echo "mvNCCheck -s 12 caffe_files/resnet18_2.prototxt -w caffe_files/resnet-18.caffemodel -i ./images/nps_electric_guitar.png -s 12 -id 546 -S 255 -M ./data/ilsvrc_2012_mean.npy -metric top1 > ncs1_caffe_mvnccheckfiles/resnet18_mvnccheck.txt"
mvNCCheck -s 12 caffe_files/resnet18_2.prototxt -w caffe_files/resnet-18.caffemodel -i ./images/nps_electric_guitar.png -s 12 -id 546 -S 255 -M ./data/ilsvrc_2012_mean.npy -metric top1 > ncs1_caffe_mvnccheckfiles/resnet18_mvnccheck.txt
sleep 3
echo "\n"
echo "mvNCCheck -s 12 caffe_files/ResNet-50-deploy.prototxt -w caffe_files/ResNet-50-model.caffemodel  -i ./images/nps_electric_guitar.png -s 12 -id 546 -S 255 -M ./data/ilsvrc_2012_mean.npy -metric top1  > ncs1_caffe_mvnccheckfiles/resnet50_mvnccheck.txt"
mvNCCheck -s 12 caffe_files/ResNet-50-deploy.prototxt -w caffe_files/ResNet-50-model.caffemodel  -i ./images/nps_electric_guitar.png -s 12 -id 546 -S 255 -M ./data/ilsvrc_2012_mean.npy -metric top1  > ncs1_caffe_mvnccheckfiles/resnet50_mvnccheck.txt
sleep 3
echo "\n"
echo "mvNCCheck -s 12 caffe_files/VGG_ILSVRC_16_layers_deploy.prototxt -w caffe_files/VGG_ILSVRC_16_layers.caffemodel  -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 > ncs1_caffe_mvnccheckfiles/vgg16_mvnccheck.txt"
mvNCCheck -s 12 caffe_files/VGG_ILSVRC_16_layers_deploy.prototxt -w caffe_files/VGG_ILSVRC_16_layers.caffemodel  -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 > ncs1_caffe_mvnccheckfiles/vgg16_mvnccheck.txt
sleep 3
echo "\n"
echo "mvNCCheck -s 12 caffe_files/MobileNetSSD_deploy.prototxt -w caffe_files/MobileNetSSD_deploy.caffemodel -metric ssd_pred_metric"
mvNCCheck -s 12 caffe_files/MobileNetSSD_deploy.prototxt -w caffe_files/MobileNetSSD_deploy.caffemodel -metric ssd_pred_metric> ncs1_caffe_mvnccheckfiles/ssdmobilenet_mvnccheck.txt
sleep 3

echo "mvNCCheck -s 12 caffe_files/tiny-yolo-v1.prototxt -w caffe_files/tiny-yolo-v1_53000.caffemodel -metric accuracy_metrics> ncs1_caffe_mvnccheckfiles/tinyyolov1_mvnccheck.txt"
mvNCCheck -s 12 caffe_files/tiny-yolo-v1.prototxt -w caffe_files/tiny-yolo-v1_53000.caffemodel -metric accuracy_metrics> ncs1_caffe_mvnccheckfiles/tinyyolov1_mvnccheck.txt
sleep 3

echo "\n"
