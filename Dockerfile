# This image provide AWS CLI Tools to k8s jobs managing AWS assets
# This is usefull for creating k8s Cron Jobs and the like
FROM alpine:3.6

LABEL "com.gjyoung1974.ops.utils.aws-cli"="gjyoung1974"
LABEL "MAINTAINER"="gjyoung1974 <gjyoung1974@gmail.com>"

# Versions: https://pypi.python.org/pypi/awscli#downloads
ENV AWS_CLI_VERSION 1.15.3

RUN apk --no-cache update && \
    apk --no-cache add python py-pip less bash && \
    pip --no-cache-dir install awscli==${AWS_CLI_VERSION} && \
    apk -v --purge del py-pip && \
    rm -rf /var/cache/apk/*

ENV AWS_CLI_VERSION 1.14.17
ENV AWS_DEFAULT_OUTPUT='json'
ENV KEY_ID='some-key-id'
ENV SECRET_KEY='some-secret-id'

# Will be set at Runtime, fetched from  secrets secure storage
ENV AWS_DEFAULT_REGION='us-west-2'
ENV KEY_ID='some-key-id'
ENV SECRET_KEY='some-secret-key'

RUN mkdir -p /var/run/aws
RUN mkdir -p /root/.aws
