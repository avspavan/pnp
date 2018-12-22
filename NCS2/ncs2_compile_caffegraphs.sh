#! /bin/bash
echo "Starting ncs2 caffe graph compiling"
rm -rf ncs2graphs
rm -rf ncs2_caffe_mvnccheckfiles
mkdir -p ncs2graphs
mkdir -p ncs2graphs/caffe_graphs
mkdir -p ncs2graphs/caffe_graphs/hwgraphs
mkdir -p ncs2_caffe_mvnccheckfiles
cd caffe_files
# commenting out shave (SW) networks
: <<'END1'
num=0
num=$(($num+1))
echo $num
mvNCCompile -s 16 Alexnet_deploy.prototxt -w bvlc_alexnet.caffemodel -o ../ncs2graphs/caffe_graphs/caffe_alexnet_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 16 googlenetv1_deploy.prototxt -w bvlc_googlenet.caffemodel -o ../ncs2graphs/caffe_graphs/caffe_googlenetv1_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 16 squeezenet_deploy.prototxt -w squeezenet_v1.0.caffemodel -o ../ncs2graphs/caffe_graphs/caffe_squeezenet_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 16 resnet18_2.prototxt -w resnet-18.caffemodel -o ../ncs2graphs/caffe_graphs/caffe_resnet18_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 16 ResNet-50-deploy.prototxt -w ResNet-50-model.caffemodel -o ../ncs2graphs/caffe_graphs/caffe_resnet50_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 16 VGG_ILSVRC_16_layers_deploy.prototxt -w VGG_ILSVRC_16_layers.caffemodel -o ../ncs2graphs/caffe_graphs/caffe_vgg16_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 16 tiny-yolo-v1.prototxt -w tiny-yolo-v1_53000.caffemodel -o ../ncs2graphs/caffe_graphs/caffe_tinyyolov1_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 16 MobileNetSSD_deploy.prototxt -w MobileNetSSD_deploy.caffemodel -o ../ncs2graphs/caffe_graphs/caffe_ssdmobilenet_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 16 mobilenethw/NetworkConfig.prototxt -w mobilenethw/NetworkConfig.caffemodel -o ../ncs2graphs/caffe_graphs/caffe_mobilenet_graph   
num=$(($num+1))
echo $num
END1

echo $num
echo "compiling VGG network"
mvNCCompile -s 4 --ma2480  -S 255 -M 127 -i ../images/cat.jpg -is 224 224 VGG_ILSVRC_16_layers_deploy.prototxt -w VGG_ILSVRC_16_layers.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_vgghw_graph  
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480 -S 255 -M 127 -i ../images/cat.jpg -is 224 224 googlenetv1_deploy.prototxt -w bvlc_googlenet.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenetv1hw_graph 
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480 tinyyolov1_3class_hw/tiny-yolo-class-3_padded.prototxt -w tinyyolov1_3class_hw/tiny-yolo-class-3_padded.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_tinyyolov1hw3c_graph  
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480 -S 255 -M 127 -i ../images/cat.jpg -is 224 224 -w googlenetMX/googlenet_mx_val_40000.caffemodel googlenetMX/mx_deploy.prototxt -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenetMXhw_graph   
num=$(($num+1))
echo $num
mvNCCompile --ma2480 -S 255 -M 127 -i ../images/cat.jpg -is 224 224 t0googlenetnew/BNNetworkConfig_new.prototxt -w t0googlenetnew/BNNetworkConfig_new.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_googlenethw_graph 
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480 -S 255 -M 127 -i ../images/cat.jpg -is 224 224 mobilenethw/NetworkConfig.prototxt -w mobilenethw/NetworkConfig.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_mobilenethw_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480 -S 255 -M 127 -i ../images/cat.jpg -is 224 224 resnet18_2.prototxt -w resnet-18.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_resnet18hw_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480 -S 255 -M 127 -i ../images/cat.jpg -is 224 224 ResNet-50-deploy.prototxt -w ResNet-50-model.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_resnet50hw_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480 MobileNetSSD_deploy.prototxt -w MobileNetSSD_deploy.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_ssdmobilenethw_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480  -S 255 -M 127 -i ../images/cat.jpg -is 227 227 Alexnet_deploy.prototxt -w bvlc_alexnet.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_alexnethw_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480  -S 255 -M 127 -i ../images/cat.jpg -is 227 227 squeezenet_deploy.prototxt -w squeezenet_v1.0.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_squeezenethw_graph   
num=$(($num+1))
echo $num
mvNCCompile -s 4 --ma2480  tiny-yolo-v1.prototxt -w tiny-yolo-v1_53000.caffemodel -o ../ncs2graphs/caffe_graphs/hwgraphs/caffe_tinyyolov1hw_graph   
num=$(($num+1))
echo $num
#commenting out shave (SW) mvncchecks
: << 'END'
echo "Completed compiling Caffe NCS graphs"
sleep 3
cd ..
echo "\n"
echo "mvNCCheck -s 16 caffe_files/Alexnet_deploy.prototxt -w caffe_files/bvlc_alexnet.caffemodel -i ./images/cat.jpg -s 16 -id 281 -M 110 -S 255 -metric top1 > ./ncs2_caffe_mvnccheckfiles/alexnet_mvnccheck.txt"
mvNCCheck -s 16 caffe_files/Alexnet_deploy.prototxt -w caffe_files/bvlc_alexnet.caffemodel -i ./images/cat.jpg -id 281 -M 110 -S 255 -metric top1   > ./ncs2_caffe_mvnccheckfiles/alexnet_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
echo "mvNCCheck -s 16 caffe_files/googlenetv1_deploy.prototxt -w caffe_files/bvlc_googlenet.caffemodel -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 > ncs2_caffe_mvnccheckfiles/googlenetv1_mvnccheck.txt"
mvNCCheck -s 16 caffe_files/googlenetv1_deploy.prototxt -w caffe_files/bvlc_googlenet.caffemodel -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1   > ncs2_caffe_mvnccheckfiles/googlenetv1_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
echo "mvNCCheck -s 16 caffe_files/squeezenet_deploy.prototxt -w caffe_files/squeezenet_v1.0.caffemodel -i ./images/cat.jpg -id 281 -S 255 -M 120 -metric top1 > ncs2_caffe_mvnccheckfiles/squeezenet_mvnccheck.txt"
mvNCCheck -s 16 caffe_files/squeezenet_deploy.prototxt -w caffe_files/squeezenet_v1.0.caffemodel -i ./images/cat.jpg -id 281 -S 255 -M 120 -metric top1   > ncs2_caffe_mvnccheckfiles/squeezenet_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
echo "mvNCCheck -s 16 caffe_files/resnet18_2.prototxt -w caffe_files/resnet-18.caffemodel -i ./images/nps_electric_guitar.png -s 16 -id 546 -S 255 -M ./data/ilsvrc_2012_mean.npy -metric top1 > ncs2_caffe_mvnccheckfiles/resnet18_mvnccheck.txt"
mvNCCheck -s 16 caffe_files/resnet18_2.prototxt -w caffe_files/resnet-18.caffemodel -i ./images/nps_electric_guitar.png -s 16 -id 546 -S 255 -M ./data/ilsvrc_2012_mean.npy -metric top1   > ncs2_caffe_mvnccheckfiles/resnet18_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
echo "mvNCCheck -s 16 caffe_files/ResNet-50-deploy.prototxt -w caffe_files/ResNet-50-model.caffemodel  -i ./images/nps_electric_guitar.png -s 16 -id 546 -S 255 -M ./data/ilsvrc_2012_mean.npy -metric top1  > ncs2_caffe_mvnccheckfiles/resnet50_mvnccheck.txt"
mvNCCheck -s 16 caffe_files/ResNet-50-deploy.prototxt -w caffe_files/ResNet-50-model.caffemodel  -i ./images/nps_electric_guitar.png -s 16 -id 546 -S 255 -M ./data/ilsvrc_2012_mean.npy -metric top1    > ncs2_caffe_mvnccheckfiles/resnet50_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
echo "mvNCCheck -s 16 caffe_files/VGG_ILSVRC_16_layers_deploy.prototxt -w caffe_files/VGG_ILSVRC_16_layers.caffemodel  -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 > ncs2_caffe_mvnccheckfiles/vgg16_mvnccheck.txt"
mvNCCheck -s 16 caffe_files/VGG_ILSVRC_16_layers_deploy.prototxt -w caffe_files/VGG_ILSVRC_16_layers.caffemodel  -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1   > ncs2_caffe_mvnccheckfiles/vgg16_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
echo "mvNCCheck -s 16 caffe_files/MobileNetSSD_deploy.prototxt -w caffe_files/MobileNetSSD_deploy.caffemodel -metric ssd_pred_metric"
mvNCCheck -s 16 caffe_files/MobileNetSSD_deploy.prototxt -w caffe_files/MobileNetSSD_deploy.caffemodel -metric ssd_pred_metric   >ncs2_caffe_mvnccheckfiles/ssdmobilenet_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "mvNCCheck -s 16 caffe_files/tiny-yolo-v1.prototxt -w caffe_files/tiny-yolo-v1_53000.caffemodel > ncs2_caffe_mvnccheckfiles/tinyyolov1_mvnccheck.txt"
mvNCCheck -s 16 caffe_files/tiny-yolo-v1.prototxt -w caffe_files/tiny-yolo-v1_53000.caffemodel    > ncs2_caffe_mvnccheckfiles/tinyyolov1_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
mvNCCheck -s 16 caffe_files/mobilenethw/NetworkConfig.prototxt -w caffe_files/mobilenethw/NetworkConfig.caffemodel -metric top1     > ncs2_caffe_mvnccheckfiles/mobilenet_mvnccheck.txt  
num=$(($num+1))
echo $num
echo "\n"
END

echo "checks on hardware networks starting"
cd caffe_files
sleep 3
mvNCCheck -s 4 --ma2480 -S 255 -M 127 VGG_ILSVRC_16_layers_deploy.prototxt -w VGG_ILSVRC_16_layers.caffemodel  -metric top1    > ../ncs2_caffe_mvnccheckfiles/vgghw_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
mvNCCheck -s 4 --ma2480 tiny-yolo-v1.prototxt -w tiny-yolo-v1_53000.caffemodel  -metric accuracy_metrics    > ../ncs2_caffe_mvnccheckfiles/tinyyolohw_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
mvNCCheck -s 4 --ma2480 tinyyolov1-3class_hw/tiny-yolo-class-3_padded.prototxt -w tinyyolov1-3class_hw/tiny-yolo-class-3_padded.caffemodel --scheduler yolo_tiny > ../ncs2_caffe_mvnccheckfiles/tinyyolohw3c_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
mvNCCheck -s 4 --ma2480 -S 255 -M 127 -w googlenetMX/googlenet_mx_val_40000.caffemodel googlenetMX/mx_deploy.prototxt -metric top1    > ../ncs2_caffe_mvnccheckfiles/googlenetmx_mvnccheck.txt 
num=$(($num+1))
echo $num
sleep 3
mvNCCheck -s 4 --ma2480 -S 255 -M 127 t0googlenetnew/BNNetworkConfig_new.prototxt -w t0googlenetnew/BNNetworkConfig_new.caffemodel  -metric top1 > ../ncs2_caffe_mvnccheckfiles/newgooglenethw_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
mvNCCheck -s 4 --ma2480 -S 255 -M 127 mobilenethw/NetworkConfig.prototxt -w mobilenethw/NetworkConfig.caffemodel -metric top1     > ../ncs2_caffe_mvnccheckfiles/mobilenethw_mvnccheck.txt  
num=$(($num+1))
echo $num
sleep 3
mvNCCheck -s 4 --ma2480 -S 255 -M 127 resnet18_2.prototxt -w resnet-18.caffemodel  -metric top1     > ../ncs2_caffe_mvnccheckfiles/resnet18hw_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
mvNCCheck -s 4 --ma2480 -S 255 -M 127 ResNet-50-deploy.prototxt  -w ResNet-50-model.caffemodel  -metric top1    > ../ncs2_caffe_mvnccheckfiles/resnet50hw_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
mvNCCheck -s 4 --ma2480  MobileNetSSD_deploy.prototxt -w MobileNetSSD_deploy.caffemodel  -metric ssd_pred_metric> ../ncs2_caffe_mvnccheckfiles/ssdmobilenethw_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
mvNCCheck -s 4 --ma2480 Alexnet_deploy.prototxt -w bvlc_alexnet.caffemodel -i ../images/cat.jpg -id 281 -M 110 -S 255 -metric top1   > ../ncs2_caffe_mvnccheckfiles/alexnethw_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
echo "mvNCCheck -s 4 --ma2480 caffe_files/googlenetv1_deploy.prototxt -w caffe_files/bvlc_googlenet.caffemodel -i ./images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1 > ncs2_caffe_mvnccheckfiles/googlenetv1_mvnccheck.txt"
mvNCCheck -s 4 --ma2480 googlenetv1_deploy.prototxt -w bvlc_googlenet.caffemodel -i ../images/nps_electric_guitar.png -id 546 -S 255 -M 110 -metric top1   > ../ncs2_caffe_mvnccheckfiles/googlenetv1hw_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
echo "mvNCCheck -s 4 --ma2480 caffe_files/squeezenet_deploy.prototxt -w caffe_files/squeezenet_v1.0.caffemodel -i ./images/cat.jpg -id 281 -S 255 -M 120 -metric top1 > ncs2_caffe_mvnccheckfiles/squeezenet_mvnccheck.txt"
mvNCCheck -s 4 --ma2480 squeezenet_deploy.prototxt -w squeezenet_v1.0.caffemodel -i ../images/cat.jpg -id 281 -S 255 -M 120 -metric top1   > ../ncs2_caffe_mvnccheckfiles/squeezenethw_mvnccheck.txt
num=$(($num+1))
echo $num
sleep 3
echo "\n"
