#!/bin/bash

set -v 
BANDIT_CONFIG='/app_tmp/.bandit/bandit.config.yaml'
REPORT_HTML='/app_tmp/.bandit/reports/banditReport.html'
REPORT_TXT='/app_tmp/.bandit/reports/banditReport.txt'

mkdir '/app_tmp/.bandit/reports'

bandit -r -c ${BANDIT_CONFIG}  -f txt -o ${REPORT_TXT} ../.
cat ${REPORT_TXT}
bandit -r -c ${BANDIT_CONFIG}  -f html -o ${REPORT_HTML} ../.
