#!/bin/bash

#set -v 
#BANDIT_CONFIG='config/bandit.config.yaml'
REPORT_HTML='banditReport.html'
REPORT_TXT='banditReport.txt'

bandit -r -f txt -o shared/${REPORT_TXT} .
bandit -r -f html -o shared/${REPORT_HTML} .
