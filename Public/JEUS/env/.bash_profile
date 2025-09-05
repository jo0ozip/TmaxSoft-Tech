###############################################
# COMMON SETTING
###############################################
EDITOR=vi
export EDITOR
set -o vi
umask 077
export PS1="[\u@\h:\$(pwd)]\$ "

###############################################
# JEUS ENV  
###############################################
export JEUS_HOME=${JEUS_HOME}
export JEUS_LOG_HOME=${JEUS_LOG_HOME}
export PATH="${PATH}:${JEUS_HOME}/bin:${JEUS_HOME}/lib/system"
###############################################
# JEUS AdminServer SET
###############################################
export DOMAIN_NAME=${DOMAIN_NAME}
export DAS_HOSTNAME=`hostname`
export DAS_PORT=10000
export DAS_URL=${DAS_HOSTNAME}:${DAS_PORT}
export ENCODE_FILE=${JEUS_HOME}/bin/jeusEncode
###############################################
# JEUS ALIAS SET
###############################################
alias jhome='cd ${JEUS_HOME}'
alias jcfg='cd ${JEUS_HOME}/domains/${DOMAIN_NAME}/config'
alias jbin='cd ${JEUS_HOME}/bin'
alias jlog='cd ${JEUS_LOG_HOME}'

###############################################
# JEUS CLOUD SERVER SET
###############################################
export DOMAIN_HOME=${JEUS_HOME}/domains/${DOMAIN_NAME}
