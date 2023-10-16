#!/bin/bash

declare _PROG_NAME="stressapptest"
declare _DEPS="free grep xargs cut tee"

# called by dracut
check() {
    [[ $hostonly ]] && return 1

    require_binaries $_PROG_NAME || return 1
    local _i
    for _i in $_DEPS; do
        require_binaries $_i || return 1
    done

    return 255
}

# called by dracut
# this module has no dependencies
depends() {
    return 0
}

# called by dracut
install() {
    local _i _bin
    # install main executable
    for _i in $_PROG_NAME $_DEPS; do
        local _bin
        _bin=$(find_binary $_i)
        inst "$_bin" /usr/bin/$_i
    done

    # install hooks
    inst_hook pre-trigger 99 "$moddir"/stressapptest_run.sh
    inst_script "$moddir"/stressapptest_service.sh /usr/bin/stressapptest_service.sh
    inst "$moddir"/stressapptest.service "$systemdsystemunitdir"/stressapptest.service
}

