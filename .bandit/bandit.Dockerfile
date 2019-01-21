FROM python:3.6-slim

COPY . /app_tmp

RUN echo "USER:::::: $USER"
RUN ls -lR /app_tmp


RUN pip install bandit                    && \
    chown -R $USER: /app_tmp
RUN chmod a+x /app_tmp/.bandit/run_bandit.sh && \
    chmod 777 /app_tmp/.bandit/reports/*
WORKDIR /app_tmp
CMD ["/app_tmp/.bandit/run_bandit.sh"]