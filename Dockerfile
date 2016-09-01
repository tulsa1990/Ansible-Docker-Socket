
FROM docker


RUN apk update && apk upgrade 
RUN apk add bash
RUN apk add ansible

RUN apk add python
RUN apk add py-pip
RUN pip install docker-py

WORKDIR /root