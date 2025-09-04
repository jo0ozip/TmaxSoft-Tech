FROM 192.168.1.1:5000/rocky:sample-latest

# JEUS Version ARG : build env
ARG build_version="jeus8.5.0.0-b266025"

# JEUS env variable. env 
ENV JEUS_VERSION ${build_version}
ENV INSTALL_HOME /sw
ENV JEUS_HOME $INSTALL_HOME/jeus8.5
ENV DOMAIN_HOME $JEUS_HOME/domains/jeus_domain
ENV SCRIPT_HOME $INSTALL_HOME/script
#ENV APP_DIR $INSTALL_HOME/apps
ENV JAVA_HOME /usr/java/jdk
ENV PATH $JEUS_HOME/bin:$JEUS_HOME/lib/system:$JAVA_HOME/bin:$PATH
ENV USER jeus
ENV GROUP app

# make dir
RUN \
  mkdir -p ${JEUS_HOME} && \
  mkdir -p ${SCRIPT_HOME}  

# add user 
RUN \
  groupadd ${GROUP} -g 101 && \
  useradd -u 1001 -g ${GROUP} -m -d $JEUS_HOME -s /bin/bash -c "jeus User" ${USER}

# jeus install
ADD tmp/jeus8.5.tar.gz ${JEUS_HOME}
COPY tmp/.bash_profile ${JEUS_HOME}
COPY tmp/script ${SCRIPT_HOME}
COPY tmp/license ${JEUS_HOME}/license
#COPY tmp/config/policies.xml ${DOMAIN_HOME}/config/security/SYSTEM_DOMAIN
COPY tmp/config/cloudserver.properties ${JEUS_HOME}/bin
COPY tmp/datasource ${JEUS_HOME}/lib/datasource
COPY tmp/config/domain.xml ${SCRIPT_HOME}/domain.xml

# copy patch file
COPY tmp/patch ${JEUS_HOME}/lib

RUN \
  chmod -R 700 ${INSTALL_HOME} && \
  chown -R ${USER}:${GROUP} ${INSTALL_HOME}

# link log
RUN \
  ln -sf /dev/stdout /var/log/access.log && \
  ln -sf /dev/stderr /var/log/error.log 

WORKDIR ${JEUS_HOME}
USER ${USER}
CMD ["/sw/script/start.sh"]
