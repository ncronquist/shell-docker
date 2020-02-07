FROM ubuntu AS build

USER root
WORKDIR /home/root

ENV OS=linux
ENV ARCH=x86_64
ENV SHELLCHECK_VERSION=shellcheck-stable
ENV SHFMT_VERSION=3.0.1

RUN apt-get update && apt-get install --yes \
      curl \
      xz-utils

RUN curl \
      -O https://storage.googleapis.com/shellcheck/$SHELLCHECK_VERSION.$OS.$ARCH.tar.xz

RUN tar -xJf $SHELLCHECK_VERSION.$OS.$ARCH.tar.xz

RUN curl \
      https://github.com/mvdan/sh/releases/download/v$SHFMT_VERSION/shfmt_v$SHFMT_VERSION_$OS_amd64 \
      -o shfmt

RUN chmod +x ./shfmt

#--------------------------------------------------------------------------------
# Resulting alpine image
#--------------------------------------------------------------------------------

FROM alpine:latest AS alpine

WORKDIR /mnt

COPY --from=build /home/root/shellcheck-stable/shellcheck /bin
COPY --from=build /home/root/shfmt /bin
