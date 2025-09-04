FROM 192.168.1.1:5000/jeus8.5:latest

# JEUS env variable. env 
ENV INSTALL_HOME /sw
ENV APP_DIR $INSTALL_HOME/apps
ENV TMP $APP_DIR

USER root

# make dir
RUN \
  mkdir -p ${APP_DIR} 

#copy
COPY tmp ${TMP}

#copy app
COPY application ${APP_DIR}

# jeus install
RUN \
  mv -f ${TMP}/datasource/* ${JEUS_HOME}/lib/datasource && \
  chmod -R 700 ${INSTALL_HOME} && \
  chown -R jeus:app ${INSTALL_HOME}

WORKDIR ${JEUS_HOME}
USER ${USER}
CMD ["/sw/script/start.sh"]
