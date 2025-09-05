FROM ImageRegistry/project:tag

USER root
WORKDIR /root

# os environment
ENV USER_HOME=/home/tmaxuser
ENV JAVA_HOME=container os java home
ENV APP_HOME=application deploy home
ENV LOG_HOME=log(pv,pvc) home
ENV PATH=${JAVA_HOME}/bin:${PATH}


# Create directories, add user/group, and set ownership and permissions
RUN groupadd -g 1004 tmaxuser && \
    useradd -u 1004 -g tmaxuser -d ${USER_HOME} --create-home --skel /dev/null tmaxuser && \
    mkdir -p ${APP_HOME} ${LOG_HOME} && \
    chown -R tmaxuser:tmaxuser ${APP_HOME} ${LOG_HOME} && \
    chmod -R 750 ${APP_HOME} ${LOG_HOME}


COPY --chown=tmaxuser:tmaxuser env/.bashrc ${USER_HOME}/.bashrc

ENTRYPOINT ["/bin/bash"]
