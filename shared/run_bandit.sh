#!/bin/bash

set -v 
#BANDIT_CONFIG='config/bandit.config.yaml'
REPORT_HTML='banditReport.html'
REPORT_TXT='banditReport.txt'

if ! bandit -r -f txt -o shared/${REPORT_TXT} . ; then
    echo "Command txt succeeded"
else
    echo "Command txt failed"
fi

if ! bandit -r -f txt -o shared/${REPORT_TXT} . ; then
    echo "Command html succeeded"
else
    echo "Command html failed"
fi

echo $(cat shared/"${REPORT_TXT}")
