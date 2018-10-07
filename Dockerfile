FROM mongo:4.0

# Install Python and Cron
RUN apt-get update && \
    apt-get -y install python3 python3-pip python3-dev cron libyaml-dev

# Install AWS CLI and schedule package
RUN pip3 install awscli

ENV CRON_TIME="0 3 * * *" \
  TZ=US/Eastern \
  CRON_TZ=US/Eastern

ADD run.sh /run.sh
CMD /run.sh
