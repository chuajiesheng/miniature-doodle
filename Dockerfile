FROM ubuntu:latest AS base

LABEL maintainer="Chua Jie Sheng <hello@jschua.com>"

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y wget curl gnupg

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3 python3-pip python3-dev python3-venv gcc libffi-dev openjdk-11-jdk postgresql-client-13 musl-dev
RUN python3 -m pip install --upgrade pip

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

CMD ["python3"]