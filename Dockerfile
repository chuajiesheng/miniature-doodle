FROM python:3-alpine AS base

LABEL maintainer="Chua Jie Sheng <hello@jschua.com>"

RUN apk add --no-cache python3-dev gcc libc-dev libressl-dev musl-dev libffi-dev
RUN pip3 install --upgrade pip \
    && CRYPTOGRAPHY_DONT_BUILD_RUST=1 pip3 -r requirements.txt

CMD ["python3"]