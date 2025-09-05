#!/bin/bash
source ${WEBTOBDIR}/.bash_profile

sh ${WEBTOBDIR}/bin/env.sh
$WEBTOBDIR/bin/wsboot -c $WEBTOBDIR/config/http.m -V
