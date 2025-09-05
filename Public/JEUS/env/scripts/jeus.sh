#!/bin/sh

source ${JEUS_HOME}/bin/conf/setenv.sh

## standalone start script
# startCloudServer -u username -p password -server servername
${JEUS_HOME}/bin/startCloudServer -u $JEUS_USER -p $PASSWORD -domain ${DOMAIN_NAME} -server ${SERVERNAME} ${SCF_GROUP_ID} ${ADD_START_OPT} -verbose
