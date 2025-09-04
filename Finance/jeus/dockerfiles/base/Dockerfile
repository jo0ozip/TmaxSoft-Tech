FROM rockylinux:9.2

#JDK_install
RUN \
  mkdir -p /usr/java/jdk && \
#set dnf repo
  dnf -y update && \
  dnf -y install glibc-locale-source && \
  dnf -y install glibc-langpack-en && \
  dnf -y install net-tools && \
  dnf -y install lsof && \
  dnf -y install telnet && \
  dnf -y install findutils && \
  dnf -y install gcc && \
  dnf -y install nc && \
  dnf -y install tar && \
  dnf -y install procps && \
  dnf -y install vim && \
  dnf -y install hostname && \
  dnf -y install libxcrypt-compat && \
  dnf -y install bind-utils && \
#ap lib
  dnf -y install freetype && \
  dnf -y install fontconfig && \
  dnf -y clean all && \
#Locale Set ko_KR.EUC-KR ko_KR.UTF-8
  localedef -f EUC-KR -i ko_KR ko_KR.EUC-KR && \
  localedef -f UTF-8 -i ko_KR ko_KR.UTF-8 && \
  localedef -f UTF-8 -i en_US en_US.UTF-8 && \
  ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime 

COPY tmp/jdk /usr/java/jdk

ENV JAVA_HOME /usr/java/jdk
ENV PATH $JAVA_HOME/bin:$PATH
#ENV LANG ko_KR.EUC-KR
ENV LANG ko_KR.UTF-8
#ENV LC_ALL ko_KR.EUC-KR

#START
#WORKDIR root
#CMD ["/bin/ls", "-lh", "/root"]
CMD ["/bin/bash", "-l"]
