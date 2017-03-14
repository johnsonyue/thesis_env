FROM ubuntu:latest

MAINTAINER johnsonyue version: 0.01

#replace default apt source & install necessary packages.
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim git tar python

#setup code env.
##source.
WORKDIR /home/
RUN git clone http://github.com/johnsonyue/scanner
ENV SCAN=/home/scanner/
WORKDIR $SCAN
RUN ./setup_offline.sh

##Vim.
ENV TERM=xterm-256color
COPY vimrc molokai.vim $SCAN
RUN mkdir -p ~/.vim/colors/ && mv vimrc ~/.vim/ && mv molokai.vim ~/.vim/colors

RUN echo "include /usr/local/lib" >> /etc/ld.so.conf && ldconfig

#use default entrypoint: /bin/sh -c
CMD ["/bin/bash"]
