FROM ubuntu:precise
MAINTAINER diunko "oil.crayons@gmail.com"

RUN mkdir /build
# rename
ADD ./build/ /build

ADD ./sources.list /etc/apt/
ADD ./dist.list /etc/apt/sources.list.d/dist.list
ADD ./unstable.list /etc/apt/sources.list.d/unstable.list
RUN apt-get update
RUN apt-get install yandex-archive-keyring -y --force-yes
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCD11186050CD1A

RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /build/prepare
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
