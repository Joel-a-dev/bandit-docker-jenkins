#!/bin/bash

set -v 
#BANDIT_CONFIG='config/bandit.config.yaml'
REPORT_HTML='banditReport.html'
REPORT_TXT='banditReport.txt'

cat /bandit/test_files/test.py

bandit -v -r -f txt -o /bandit/bandit/${REPORT_TXT} /bandit
cat /bandit/bandit/${REPORT_TXT}
bandit -v -r -f html -o /bandit/bandit/${REPORT_HTML} /bandit
