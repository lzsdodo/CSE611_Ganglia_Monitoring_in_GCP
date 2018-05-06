#!/bin/bash

hn=$(hostname)
echo "$hn node"

if [ $hn == "ann" ]; then
    # Tensorflow
    for ((i=0; i<10; i++))
    do
        echo "$i time for ic tensorflow" | tee -a record_tf_ic.txt
        date | tee -a record_tf_ic.txt
        # run code
        cd ~
        cd ./code/ic
        python3 ./tf_ic.py
        cd ~
        echo "Completed" | tee -a record_tf_ic.txt
        date | tee -a record_tf_ic.txt
        sync; echo 3 | sudo tee /proc/sys/vm/drop_caches
        sleep 2m
    done

elif [ $hn == "bob" ]; then
    # MXNet
    for ((i=0; i<10; i++))
    do
        echo "$i time for ic mxnet" | tee -a record_mx_ic.txt
        date | tee -a record_mx_ic.txt
        # run code
        cd ~
        cd ./code/ic
        python3 ./mx_ic.py
        cd ~
        echo "Completed" | tee -a record_mx_ic.txt
        date | tee -a record_mx_ic.txt
        sync; echo 3 | sudo tee /proc/sys/vm/drop_caches
        sleep 2m
    done

fi