#!/bin/bash

set -v 
BANDIT_CONFIG='/app_tmp/bandit/bandit.config.yaml'
REPORT_HTML='/breports/banditReport.html'
REPORT_TXT='/breports/banditReport.txt'

bandit -r -f txt -o ${REPORT_TXT} /app_tmp
cat ${REPORT_TXT}
bandit -r -f html -o ${REPORT_HTML} /app_tmp
