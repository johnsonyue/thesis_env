FROM ubuntu:latest

MAINTAINER johnsonyue version: 0.01

#replace default apt source & install necessary packages.
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim git tar python

#setup code env.
##source.
ENV THESIS_ENV=/home/download/
RUN mkdir -p /home/download
WORKDIR $THESIS_ENV
RUN git clone http://github.com/johnsonyue/env
##Vim.
ENV TERM=xterm-256color
COPY vimrc molokai.vim $THESIS_ENV
RUN mkdir -p ~/.vim/ & cp vimrc ~/.vim/
RUN mkdir -p ~/.vim/colors/ & cp molokai.vim ~/.vim/colors/

#use default entrypoint: /bin/sh -c
CMD ["/bin/bash"]
