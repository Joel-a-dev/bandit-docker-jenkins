FROM python:3.6-alpine
#RUN apt-get update                          && \
#    apt-get install -y tree                 && \
#    apt-get install -y ca-certificates git 
COPY . /bandit
RUN pip3 install bandit                      && \
    mkdir -p /bandit                        && \
    chown -R $USER: /bandit
RUN chmod +x /bandit/shared/run_bandit.sh
WORKDIR /bandit
CMD ["./shared/run_bandit.sh"]

