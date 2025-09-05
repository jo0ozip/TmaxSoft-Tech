###############################################
# COMMON SETTING
###############################################
EDITOR=vi
export EDITOR
set -o vi
umask 077
export PS1="[\u@\h:\$(pwd)]\$ "

######################################################
#    WEBTOB 5.0.0.4 ENV                  @TmaxSoft   #
######################################################
export WEBTOBDIR=${WEBTOBDIR}
export WEBTOB_LOG_HOME=${WEBTOB_LOG_HOME}
export PATH="${WEBTOBDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${WEBTOBDIR}/lib:${LD_LIBRARY_PATH}"

######################################################
#    WEBTOB Alias Set                    @TmaxSoft   #
######################################################
alias whome='cd ${WEBTOBDIR}'
alias wcfg='cd ${WEBTOBDIR}/config'
alias wbin='cd ${WEBTOBDIR}/bin'
alias wlog='cd ${WEBTOB_LOG_HOME}'
