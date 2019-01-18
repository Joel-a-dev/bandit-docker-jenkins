#!/bin/bash

set -v 
#BANDIT_CONFIG='config/bandit.config.yaml'
REPORT_HTML='banditReport.html'
REPORT_TXT='banditReport.txt'

bandit -r -f txt -o /bandit/bandit/${REPORT_TXT} /bandit
cat /bandit/bandit/${REPORT_TXT}
bandit -r -f html -o /bandit/bandit/${REPORT_HTML} /bandit
