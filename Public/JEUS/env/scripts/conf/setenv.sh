#!/bin/bash
source ${JEUS_HOME}/.bash_profile

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
export JAVA_VM_PROPERTIES="${JAVA_VM_PROPERTIES} ${JVM_HEAP_OPTIONS} ${VM_OPTIONS}"
##################################################################

if [ -z $JAVA_HOME ]; then export JAVA_HOME="setenv java home"; fi
sed -i "s+%JAVA_HOME%+${JAVA_HOME}+g" ${JEUS_HOME}/bin/jeus.properties

# DOMAIN ID set ##################################################
if [ -z $BASE_ADDRESS ]; then export BASE_ADDRESS=0.0.0.0; fi
sed -i "s/%BASE_ADDRESS%/${BASE_ADDRESS}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $SERVERNAME ]; then export SERVERNAME=`hostname`; fi
sed -i "s/%SERVERNAME%/${SERVERNAME}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $BASE_PORT ]; then export BASE_PORT=10000; fi
sed -i "s/%BASE_PORT%/${BASE_PORT}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $ENCODING ]; then export ENCODING=UTF-8; fi
sed -i "s/%ENCODING%/${ENCODING}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $HTTP_PORT ]; then export HTTP_PORT=8080; fi
sed -i "s/%HTTP_PORT%/${HTTP_PORT}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $HTTP_THREAD_MIN ]; then export HTTP_THREAD_MIN=100; fi
sed -i "s/%HTTP_THREAD_MIN%/${HTTP_THREAD_MIN}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $HTTP_THREAD_MAX ]; then export HTTP_THREAD_MAX=100; fi
sed -i "s/%HTTP_THREAD_MAX%/${HTTP_THREAD_MAX}/g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $JEUS_LOG_HOME ]; then export JEUS_LOG_HOME="/LOG/jeus"; fi
sed -i "s+%JEUS_LOG_HOME%+${JEUS_LOG_HOME}+g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $JEUS_LOG_NAME ]; then export JEUS_LOG_NAME="jeus"; fi
sed -i "s+%JEUS_LOG_NAME%+${JEUS_LOG_NAME}+g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $JEUS_LOG_LEVEL ]; then export JEUS_LOG_LEVEL="INFO"; fi
sed -i "s+%JEUS_LOG_LEVEL%+${JEUS_LOG_LEVEL}+g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $APP_PATH ]; then export APP_PATH="/APP"; fi
sed -i "s+%APP_PATH%+${APP_PATH}+g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $APP_CONTEXT_PATH ]; then export APP_CONTEXT_PATH="/"; fi
sed -i "s+%APP_CONTEXT_PATH%+${APP_CONTEXT_PATH}+g" ${DOMAIN_HOME}/config/domain.xml

if [ -z $DBPW_AES ]; then export DBFW_AES="dbpassword"; fi
sed -i "s|%DBPW_AES%|${DBPW_AES}|g" ${DOMAIN_HOME}/config/domain.xml

# JEUS Session Cluster
export CLUSTER_MODE=${CLUSTER_MODE:-DOMAIN_WIDE} && sed -i "s/%CLUSTER_MODE%/${CLUSTER_MODE}/g" "${DOMAIN_HOME}/config/domain.xml"
export STICKY_ENCODING=${STICKY_ENCODING:-BASE64} && sed -i "s/%STICKY_ENCODING%/${STICKY_ENCODING}/g" "${DOMAIN_HOME}/config/domain.xml"
export SCF_MODE=${SCF_MODE:-MESH} && sed -i "s/%SCF_MODE%/${SCF_MODE}/g" "${DOMAIN_HOME}/config/domain.xml"
export SESSION_ID=${SESSION_ID:JSESSIONID} && sed -i "s/%SESSION_ID%/${SESSION_ID}/g" "${DOMAIN_HOME}/config/domain.xml"

# JEUS admin IP/PW
if [ -z $JEUS_USER ]; then export JEUS_USER=wasadmin; fi
if [ -z $PASSWORD ]; then export PASSWORD=jeusadmin1!; fi
