#!/bin/bash

BANDIT_CONFIG='/app_src/bandit/bandit.config.yaml'
REPORT_HTML='/app_src/reports/banditReport.html'
REPORT_TXT='/app_src/reports/banditReport.txt'
pip3 install bandit
mkdir reports
chmod -R 777 reports

bandit -r -f txt -o ${REPORT_TXT} /app_src
cat ${REPORT_TXT}
bandit -r -f html -o ${REPORT_HTML} /app_src
