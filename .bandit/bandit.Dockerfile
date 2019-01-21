FROM python:3.6-slim

COPY . /app_temp

RUN pip install bandit      && \
    mkdir -p /app_tmp
RUN chmod a+x /app_temp/.bandit/run_bandit.sh
WORKDIR /app_temp
CMD ["/app_temp/.bandit/run_bandit.sh"]