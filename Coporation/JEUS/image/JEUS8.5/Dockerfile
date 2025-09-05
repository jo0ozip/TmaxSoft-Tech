#이미지 경량화를 위한 alpine 리눅스 사용 (openjdk8 포함)
FROM openjdk:8-alpine

# JEUS Version ARG
ARG build_version="jeus8_5-b266025"

#Set Timezone
ENV TZ=Asia/Seoul
RUN \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone 
RUN \
    mkdir -p /home/app \
    mkdir -p /home/script \
    mkdir -p /home/jeus8_5/lib/datasource \
    mkdir -p /home/metrics/WEB-INF/classes \
    mkdir -p /home/metrics/WEB-INF/lib
WORKDIR /home/jeus8_5

ADD jeus8_5-b266025.tar.gz ./

# JEUS env variable.
ENV JEUS_VERSION ${build_version}
ENV JEUS_HOME /home/jeus8_5
ENV DOMAIN_HOME /home/jeus8_5/domains/domain1
ENV SCRIPT_HOME /home/script
ENV METRIC_HOME /home/metrics
ENV PATH $JEUS_HOME/bin:$JEUS_HOME/lib:$PATH

USER root
RUN chmod -R +x ${JEUS_HOME} 

COPY config/env.sh ${SCRIPT_HOME}
COPY config/start.sh ${SCRIPT_HOME}
COPY config/stop.sh ${SCRIPT_HOME}
COPY config/policies.xml ${DOMAIN_HOME}/config/security/SYSTEM_DOMAIN 
COPY config/domain.xml ${DOMAIN_HOME}/config
COPY config/cloudserver.properties ${JEUS_HOME}/bin
COPY config/postgresql-42.6.0.jar ${JEUS_HOME}/lib/datasource
COPY config/mariadb-java-client-3.0.8.jar ${JEUS_HOME}/lib/datasource
COPY metrics.class ${METRIC_HOME}/WEB-INF/classes
COPY web.xml ${METRIC_HOME}/WEB-INF
COPY clientcontainer.jar ${METRIC_HOME}/WEB-INF/lib
COPY jclient.jar ${METRIC_HOME}/WEB-INF/lib
COPY jclient_jaxb.jar ${METRIC_HOME}/WEB-INF/lib
COPY jeus-ws-maven-plugin.jar ${METRIC_HOME}/WEB-INF/lib
COPY mcast-test.jar ${METRIC_HOME}/WEB-INF/lib

# copy license file
COPY license/license ${JEUS_HOME}/license/license

# copy patch file
COPY patch/jext ${JEUS_HOME}/lib/jext
COPY patch/jlext ${JEUS_HOME}/lib/jlext
COPY patch/jnext ${JEUS_HOME}/lib/jnext

# script permission
RUN \
  chmod +x /home/script/*

#ENTRYPOINT ["/home/tmax/script/start.sh"]
CMD ["/home/script/start.sh"]
