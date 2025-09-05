#!/bin/bash

export PATH="$JEUS_HOME/bin:$JEUS_HOME/lib:$PATH"

# JEUS properties option(ex: -Djeus.scf.group-id=prozone-1 #######
ADD_START_OPT="${ADD_START_OPT}"
export ADD_START_OPT

# Set SCF ID NAME ################################################
if [ -z $SCF_ID ]; then SCF_ID="tmax-1"; fi
SCF_GROUP_ID="-Djeus.scf.group-id=${SCF_ID}"
export SCF_ID
export SCF_GROUP_ID
##################################################################

# Set JVM-Option #################################################
if [ -z "$JAVA_VM_PROPERTIES" ]; then JAVA_VM_PROPERTIES="-Xms1024m -Xmx1024m -XX:MaxMetaspaceSize=256m"; fi
export JAVA_VM_PROPERTIES
##################################################################

# DOMAIN ID set ##################################################
#BASE_ADDRESS=`grep "${HOSTNAME}" /etc/hosts | awk '{print $1}'`

if [ -z $BASE_ADDRESS ]; then export BASE_ADDRESS=0.0.0.0; fi
sed -i "s/%BASE_ADDRESS%/${BASE_ADDRESS}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $SERVERNAME ]; then export SERVERNAME=`hostname`; fi
sed -i "s/%SERVERNAME%/${SERVERNAME}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $STICKY_ENCODE ]; then export STICKY_ENCODE="BASE64"; fi
sed -i "s/%STICKY_ENCODE%/${STICKY_ENCODE}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $LOG_HOME ]; then export LOG_HOME=${LOG_HOME}; fi
sed -i "s+%LOG_HOME%+${LOG_HOME}+g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $BASE_PORT ]; then export BASE_PORT=9736; fi
sed -i "s/%BASE_PORT%/${BASE_PORT}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $HTTP_PORT ]; then export HTTP_PORT=8080; fi
sed -i "s/%HTTP_PORT%/${HTTP_PORT}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $HTTP_THREAD_MIN ]; then export HTTP_THREAD_MIN=10; fi
sed -i "s/%HTTP_THREAD_MIN%/${HTTP_THREAD_MIN}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $HTTP_THREAD_MAX ]; then export HTTP_THREAD_MAX=20; fi
sed -i "s/%HTTP_THREAD_MAX%/${HTTP_THREAD_MAX}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $LOGLEVEL ]; then export LOGLEVEL=INFO; fi
sed -i "s/%LOGLEVEL%/${LOGLEVEL}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $APP_DIR ]; then export APP_DIR=${APP_REPO}; fi
sed -i "s+%APP_DIR%+${APP_DIR}+g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $APP_NAME ]; then export APP_NAME=examples; fi
sed -i "s/%APP_NAME%/${APP_NAME}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $APP_TYPE ]; then export APP_TYPE=WAR; fi
sed -i "s/%APP_TYPE%/${APP_TYPE}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $CONTEXT_PATH ]; then export CONTEXT_PATH=/; fi
sed -i "s+%CONTEXT_PATH%+${CONTEXT_PATH}+g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $NODE_JAVA ]; then export NODE_JAVA=false; fi
sed -i "s/%NODE_JAVA%/${NODE_JAVA}/g" ${DOMAIN_HOME}/config/domain.xml

# JEUS admin IP/PW
if [ -z $JEUS_USER ]; then export JEUS_USER=jeus; fi
if [ -z $PASSWORD ]; then export PASSWORD=jeus; fi
