#!/bin/bash

#set -v 
#BANDIT_CONFIG='config/bandit.config.yaml'
REPORT_HTML='banditReport.html'
REPORT_TXT='banditReport.txt'

bandit -r -q -f txt -o shared/${REPORT_TXT} .
bandit -r -q -f html -o shared/${REPORT_HTML} .

echo $(cat shared/"${REPORT_TXT}")
