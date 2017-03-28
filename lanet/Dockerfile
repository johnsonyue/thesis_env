FROM ubuntu:latest

MAINTAINER johnsonyue version: 0.01

#replace default apt source & install necessary packages.
RUN sed -i 's/archive.ubuntu.com/archive.ubuntu.com/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim git tar build-essential automake zlib1g-dev libboost-dev libboost-date-time-dev libboost-thread-dev libpng-dev libjpeg8-dev libtiff5-dev libopenexr-dev libblas-dev libgsl-dev

#povray.
ENV HOME=/home/lanet/
RUN mkdir -p $HOME
WORKDIR $HOME
RUN git clone https://github.com/POV-Ray/povray.git
WORKDIR povray
RUN cd unix/ && ./prebuild.sh && cd ../ && ./configure COMPILED_BY="johnsonyue johnsonyue@gmail.com" && make && make install
WORKDIR ../

#lanet.
COPY LaNet-vi_3.0.1.tar.gz .
RUN tar zxvf LaNet-vi_3.0.1.tar.gz
WORKDIR LaNet-vi_3.0.1/
RUN make
WORKDIR ../
RUN rm LaNet-vi_3.0.1.tar.gz
##Vim.
ENV TERM=xterm-256color
COPY vimrc molokai.vim ./
RUN mkdir -p ~/.vim/colors/ && mv vimrc ~/.vim/ && mv molokai.vim ~/.vim/colors

#use default entrypoint: /bin/sh -c
CMD ["/bin/bash"]
