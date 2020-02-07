FROM docker:19

RUN apk add --no-cache \
  make \
  git \
  curl \
  bash

RUN curl https://raw.githubusercontent.com/rosineygp/mkdkr/master/.mkdkr > /usr/local/bin/.mkdkr
