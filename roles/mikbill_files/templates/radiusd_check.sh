#!/bin/bash
 
STATS="/var/log/radius_test.log"
RADTEST=$(which radtest)
AWK=$(which awk)

FREERAD_SRV_IP="127.0.0.1"
FREERAD_SECRET="testing123"
 
${RADTEST} testing radius $FREERAD_SRV_IP 10 $FREERAD_SECRET > $STATS
RESULT=$(${AWK} 'END{print}' ${STATS} | ${AWK} '{print $2}')

if [ "${RESULT}" == "Access-Reject" ];
then
#    echo "radiusd OK "
exit
else
    systemctl stop {{ OS.radius.name }}
    sleep 1
    systemctl start {{ OS.radius.name }}
fi
