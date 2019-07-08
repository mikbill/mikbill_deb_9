#!/bin/bash

UNAME=`which uname`
SYSTEM=`$UNAME`
PHP=`which php`

MIKBILL_PATH_LINUX="/var/www/mikbill"
MIKBILL_PATH_BSD="/usr/local/www/mikbill"

case $SYSTEM in
Linux)
    cd $MIKBILL_PATH_LINUX/admin
;;
FreeBSD)
    cd $MIKBILL_PATH_BSD/admin
;;
esac

$PHP index.php config_mrtg_gen
