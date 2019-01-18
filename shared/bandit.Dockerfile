FROM python:3.6-slim

RUN pip install bandit 
RUN mkdir -p /bandit                               && \
    chown -R $USER: /bandit

COPY . /bandit

RUN chmod +x /bandit/shared/run_bandit.sh

WORKDIR /bandit

CMD ["./shared/run_bandit.sh"]