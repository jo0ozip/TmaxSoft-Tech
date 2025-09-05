#.bashrc

if   [ -f "${JEUS_HOME}/.bash_profile" ]; then
    source "${JEUS_HOME}/.bash_profile"
elif [ -f "${WEBTOBDIR}/.bash_profile" ]; then
    source "${WEBTOBDIR}/.bash_profile"
elif [ -f "${HOME}/.bash_profile" ]; then
    source "${HOME}/.bash_profile"
fi
