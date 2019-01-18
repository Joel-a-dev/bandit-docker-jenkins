#!/bin/bash

set -v 
#BANDIT_CONFIG='config/bandit.config.yaml'
REPORT_HTML='/bandit/bandit/banditReport.html'
REPORT_TXT='/bandit/bandit/banditReport.txt'

bandit -v -r -f txt -o ${REPORT_TXT} /bandit
cat ${REPORT_TXT}
bandit -v -r -f html -o ${REPORT_HTML} /bandit
