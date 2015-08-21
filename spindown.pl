#!/bin/sh

#sudo blkid
hdduid="31699cc5-fdb8-4cb4-aee5-d2d6c8e8c540"

model=`sudo hdparm -I /dev/disk/by-uuid/$hdduid | grep -i "Model Number" | awk -F ":" '{ print $2 }' | xargs`
case $1 in
    config)
        #graph_args --base 1 --lower-limit 0
        echo "graph_title Spindown graph for $model"
        echo "graph_vlabel {3} working {2} active/idle {1} standby {0} error state}"
        echo "load.label $model"
        echo "graph_scale no"
        echo "graph_period second"
        echo "graph_category SPINDOWN"
        echo "load.warning 3"
        echo "load.critical 0"
        echo "graph_info Spindown activity for the five minutes for $model"
        echo "load.info Spindown activity for the five minutes."
    exit 0;;
esac


status=`sudo hdparm -C /dev/disk/by-uuid/$hdduid |grep -i "drive state" | awk -F ":" '{print $2}' | xargs`


case $status in
    standby)
        printf "load.value "
        echo "1"
        ;;
    *active*|*idle*)
        printf "load.value "
        echo "2"
        ;;
    working)
        printf "load.value "
        echo "3"
        ;;
    *)
        printf "load.value "
        echo "0"
        ;;
esac
