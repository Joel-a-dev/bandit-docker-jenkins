FROM python:3.6-slim

COPY . /app_tmp

RUN pip install bandit                   && \
    mkdir /reports                       && \
    chmod -R 777 /reports
#    chown -R $USER: /app_tmp
RUN chmod a+x /app_tmp/bandit/run_bandit.sh
WORKDIR /app_tmp
CMD ["/app_tmp/bandit/run_bandit.sh"]