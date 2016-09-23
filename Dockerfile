
FROM docker


RUN apk update && apk upgrade 
RUN apk add bash
RUN apk add ansible

RUN apk add python
RUN apk add py-pip

# Workaround for an issue with Ansible
# https://github.com/ansible/ansible/issues/17495
RUN pip install 'docker-py==1.9.0'

WORKDIR /root