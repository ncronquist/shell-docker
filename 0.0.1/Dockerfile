ARG SHELLCHECK_VERSION_DEFAULT=0.7.0
ARG SHFMT_VERSION_DEFAULT=3.0.1

FROM ubuntu AS build

USER root
WORKDIR /home/root

ARG SHELLCHECK_VERSION_DEFAULT
ARG SHFMT_VERSION_DEFAULT

ENV OS=linux
ENV ARCH=x86_64
ENV SHELLCHECK_VERSION=$SHELLCHECK_VERSION_DEFAULT
ENV SHFMT_VERSION=$SHFMT_VERSION_DEFAULT

RUN apt-get update && apt-get install --yes \
      curl \
      xz-utils

RUN curl \
      -O "https://storage.googleapis.com/shellcheck/shellcheck-v${SHELLCHECK_VERSION}.${OS}.${ARCH}.tar.xz"

RUN tar -xJf "shellcheck-v${SHELLCHECK_VERSION}.${OS}.${ARCH}.tar.xz"

RUN curl \
      -L "https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_${OS}_amd64" \
      --output shfmt

RUN chmod +x ./shfmt

#--------------------------------------------------------------------------------
# Resulting alpine image
#--------------------------------------------------------------------------------

FROM alpine:latest AS alpine

WORKDIR /mnt

ARG SHELLCHECK_VERSION_DEFAULT
ARG SHFMT_VERSION_DEFAULT

ENV SHELLCHECK_VERSION=$SHELLCHECK_VERSION_DEFAULT
ENV SHFMT_VERSION=$SHFMT_VERSION_DEFAULT

COPY --from=build "/home/root/shellcheck-v${SHELLCHECK_VERSION}/shellcheck" /bin
COPY --from=build /home/root/shfmt /bin
