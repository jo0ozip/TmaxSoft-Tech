#!/bin/bash
source ${WEBTOBDIR}/.bash_profile

if [ -z $WEBTOBDIR ]; then export WEBTOBDIR=${WEBTOBDIR}; fi
sed -i "s,%WEBTOBDIR%,${WEBTOBDIR},g" ${WEBTOBDIR}/config/http.m

if [ -z $WEBTOB_LOG_HOME ]; then export WEBTOB_LOG_HOME=${WEBTOB_LOG_HOME}; fi
sed -i "s,%WEBTOBLOGHOME%,${WEBTOB_LOG_HOME},g" ${WEBTOBDIR}/config/http.m

if [ -z $SERVERNAME ]; then export SERVERNAME=tmaxsoft; fi
sed -i "s/%SERVERNAME%/${SERVERNAME}/g" ${WEBTOBDIR}/config/http.m

if [ -z $HTH_COUNT ]; then export HTH_COUNT=2; fi
sed -i "s/%HTH_COUNT%/${HTH_COUNT}/g" ${WEBTOBDIR}/config/http.m

if [ -z $APP_DOCROOT ]; then export APP_DOCROOT=/APP/webapp; fi
sed -i "s|%APP_DOCROOT%|${APP_DOCROOT}|g" ${WEBTOBDIR}/config/http.m

if [ -z $SERVICE_PORT ]; then export SERVICE_PORT=8080; fi
sed -i "s/%SERVICE_PORT%/${SERVICE_PORT}/g" ${WEBTOBDIR}/config/http.m

if [ -z $JEUS_DOMAIN ]; then export JEUS_DOMAIN="100.100.100.100:8080"; fi
sed -i "s/%JEUS_DOMAIN%/${JEUS_DOMAIN}/g" ${WEBTOBDIR}/config/http.m

if [ -z $SERVICENAME ]; then export SERVICENAME="tmaxsoft"; fi
sed -i "s/%SERVICENAME%/${SERVICENAME}/g" ${WEBTOBDIR}/config/http.m
