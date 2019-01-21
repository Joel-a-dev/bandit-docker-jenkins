FROM python:3.6-slim
RUN pip install bandit      && \
    mkdir -p /app_tmp       && \
    chown -R $USER: /app_temp
RUN chmod +x /app_temp/.bandit/run_bandit.sh
WORKDIR /app_temp
CMD ["./app_temp/.bandit/run_bandit.sh"]