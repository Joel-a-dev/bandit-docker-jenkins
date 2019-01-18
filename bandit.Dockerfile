FROM python:3.6-alpine
#RUN apt-get update                          && \
#    apt-get install -y tree                 && \
#    apt-get install -y ca-certificates git 
COPY . /bandit
#RUN pip3 install bandit                      
RUN mkdir -p /bandit                        
RUN chmod +x /bandit/shared/run_bandit.sh
WORKDIR /bandit
RUN echo $(ls shared/)
CMD ["/bandit/shared/run_bandit.sh"]

