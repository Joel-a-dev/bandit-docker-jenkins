FROM python:3.6-slim

COPY . /app_src

RUN pip3 install bandit                   && \
    mkdir /reports                       && \
    chmod -R 777 /reports
#    chown -R $USER: /app_src
RUN chmod a+x /app_src/bandit/run_bandit.sh
WORKDIR /app_src
CMD ["/app_src/bandit/run_bandit.sh"]