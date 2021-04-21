FROM python:3-alpine AS base

LABEL maintainer="Chua Jie Sheng <hello@jschua.com>"

RUN apk add --no-cache build-base python3-dev gcc libc-dev libressl-dev musl-dev libffi-dev wget git cmake
RUN python3 -m pip install --upgrade pip

COPY requirements.txt /tmp/requirements.txt
RUN CRYPTOGRAPHY_DONT_BUILD_RUST=1 pip3 install -r /tmp/requirements.txt

CMD ["python3"]