FROM python:buster AS base

LABEL maintainer="Chua Jie Sheng <hello@jschua.com>"

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN apt-get install -y wget curl
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y python3-dev gcc libffi-dev openjdk-11-jdk postgresql-client-13 musl-dev
RUN python3 -m pip install --upgrade pip

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

CMD ["python3"]