FROM python:3.6-slim

RUN pip install bandit 
RUN mkdir -p /bandit                               && \
    chown -R $USER: /bandit
RUN ls

COPY . /bandit

RUN chmod +x /bandit/bandit/run_bandit.sh

WORKDIR /bandit

CMD ["./bandit/run_bandit.sh"]