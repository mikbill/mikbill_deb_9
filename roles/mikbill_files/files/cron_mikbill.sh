#!/bin/bash

UNAME=`which uname`
ARCH=`$UNAME -m`
SYSTEM=`$UNAME`
NULL=" >/dev/null"

APP_ECHO=`which echo`
APP_WGET=`which wget`
APP_GREP=`which grep`
APP_AWK=`which awk`
APP_CAT=`which cat`
APP_RM=`which rm`
APP_MD5=`which md5sum`
APP_CHMOD=`which chmod`
APP_CHOWN=`which chown`
APP_TAR=`which tar`
APP_DATE=`which date`
APP_CP=`which cp`

MIKBILL_PATH_LINUX="/var/www/mikbill"
MIKBILL_PATH_BSD="/usr/local/www/mikbill"
MIKBILL_PATH_LINUX_INST="/var/www"
MIKBILL_PATH_BSD_INST="/usr/local/www"
MIKBILL_LOG_UPDATE="mikbill_update.log"
MIKBILL_UPDATE_PROGRAMM="mikbill_update.sh"

case $SYSTEM in
Linux)
    cd $MIKBILL_PATH_LINUX/admin/sys/update/
;;
FreeBSD)
    cd $MIKBILL_PATH_BSD/admin/sys/update/
;;
esac
$APP_DATE >> ./$MIKBILL_LOG_UPDATE
./$MIKBILL_UPDATE_PROGRAMM >> ./$MIKBILL_LOG_UPDATE
