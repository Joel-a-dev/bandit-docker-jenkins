#FROM python:3.6-slim
#RUN apt-get update                          && \
#    apt-get install -y tree                 && \
#    apt-get install -y ca-certificates git 
#COPY . /bandit
#RUN pip3 install bandit                      
#RUN mkdir -p /bandit                        
#RUN chmod +x /bandit/shared/run_bandit.sh
#WORKDIR /bandit
#RUN echo $(ls shared/)
#CMD ["/bandit/shared/run_bandit.sh"]

FROM alpine


ENV PYTHONUNBUFFERED 1
ENV user=bandit

COPY . /bandit

# install python and bandit 
RUN apk add --no-cache py3-pip python3 bash        && \
    pip install --no-cache-dir -U pip              && \
    pip install --no-cache-dir -U bandit           && \
    mkdir -p /bandit                               && \
    addgroup -S bandit                             && \
    adduser -D -S -h /src -G bandit bandit         && \
    chown -R bandit:bandit /bandit

USER ${user}

WORKDIR /bandit

CMD ["/bandit/shared/run_bandit.sh"]

