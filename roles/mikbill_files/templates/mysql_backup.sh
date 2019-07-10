#!/bin/bash

BACKUP_DIR="{{ mikbill.dirs.home }}/mysql_backups"
BACKUP_NAME="`date +%F`_mikbill"
BACKUP_REMOVE=1
BACKUP_REMOVE_DAYS=7

MIKBILL_DIR="{{ OS.mikbill.dirs.www }}"
ADMIN_CONF="admin/app/etc/config.xml"
xml_config=`cat $MIKBILL_DIR/$ADMIN_CONF`

host=$(grep -oPm1 "(?<=<host>)[^<]+" <<< "$xml_config")
username=$(grep -oPm1 "(?<=<username>)[^<]+" <<< "$xml_config")
password=$(grep -oPm1 "(?<=<password>)[^<]+" <<< "$xml_config")
database=$(grep -oPm1 "(?<=<dbname>)[^<]+" <<< "$xml_config")

if [ ! -d $BACKUP_DIR ]; then
	mkdir -p $BACKUP_DIR
fi

mysqldump -h $host --single-transaction --quick -u $username -p$password $database | gzip > $BACKUP_DIR/$BACKUP_NAME.sql.gz

if [ $BACKUP_REMOVE -eq 1 ]; then
	find $BACKUP_DIR -mtime +"$BACKUP_REMOVE_DAYS" -type f |sort|xargs rm -f
fi
