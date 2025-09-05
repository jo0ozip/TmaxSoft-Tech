#!/bin/sh

source ${JEUS_HOME}/bin/conf/setenv.sh

${JEUS_HOME}/bin/stopServer -host `hostname`:$BASE_PORT -u $JEUS_USER -p $PASSWORD -g local-shutdown
