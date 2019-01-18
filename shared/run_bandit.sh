#!/bin/bash

set -v 
#BANDIT_CONFIG='config/bandit.config.yaml'
REPORT_HTML='banditReport.html'
REPORT_TXT='banditReport.txt'

bandit -r -f txt -o /bandit/shared/${REPORT_TXT} .
cat /bandit/shared/${REPORT_TXT}
bandit -r -f html -o /bandit/shared/${REPORT_HTML} . 
