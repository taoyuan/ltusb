#!/usr/bin/env bash

for sysdevpath in $(find /sys/bus/usb/devices/usb*/ -name dev); do
  syspath="${sysdevpath%/dev}"
  devname="$(udevadm info -q name -p $syspath)"
  vendor=$(udevadm info -p $syspath -q all |grep "ID_VENDOR_ID" |sed 's/ID_VENDOR_ID=//g'|awk '{print($2)}')
  model=$(udevadm info -p $syspath -q all |grep "ID_MODEL_ID" |sed 's/ID_MODEL_ID=//g'|awk '{print($2)}')

  #udevadm info -p $syspath -q all
  kind="0"

  [[ "$devname" == "bus/"* ]] && continue
  eval "$(udevadm info -q property --export -p $syspath)"
  [[ -z "$ID_SERIAL" ]] && continue
  if [[ $(echo /dev/$devname|grep -v hidraw|grep -v '/dev/usb' | grep -c '' ) > 0 ]];then
    if [[ $(echo $devname | sed 's/ideo/ /g' |wc -w) >1 ]]; then
      kind="video"
    elif [[ $(echo $devname | sed 's/ty/ /g' |wc -w) >1 ]]; then
      kind="serial"
    fi
    if [[ $kind != "0" ]]; then
      hub=$(echo $syspath | sed 's/\/sys\/bus\/usb\/devices\/usb//g' | sed 's/\// /g'| awk '{print($3)}')
      usb="{\"dev\":\"/dev/$devname\",\"type\":\"$kind\",\"hub\":\"$hub\",\"product\":\"$vendor:$model\",\"serial\":\"$ID_SERIAL\"}"
      if [[ $usbs ]]; then
        usbs="$usbs,$usb"
      else
        usbs="$usb"
      fi
    fi
  fi
done
echo -n [$usbs]
