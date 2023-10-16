#!/bin/bash

if ! getargbool 0 rd.sat; then
    return 0
fi

_free=$(cat /proc/meminfo | grep MemFree | xargs | cut -d ' ' -f 2)
_default_M=$((_free / 1024 / 20 * 19))

_sat_M=$(getargnum $_default_M 1 1000000000 rd.sat.memsz=)
_sat_s=$(getargnum 10 1 1000000000 rd.sat.time=)

echo "TIME=${_sat_s}" > /tmp/rd.sat.env
echo "SIZE=${_sat_M}" >> /tmp/rd.sat.env

systemctl start stressapptest.service

emergency_shell
