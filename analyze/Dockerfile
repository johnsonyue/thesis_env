FROM ubuntu:latest

MAINTAINER johnsonyue version: 0.01

#replace default apt source & install necessary packages.
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim git tar python python-setuptools python-networkx build-essential automake screen zlib1g-dev libbz2-dev

#setup code env.
##source.
ENV THESIS_ENV=/home/thesis_env/
RUN mkdir -p /home/thesis_env
WORKDIR $THESIS_ENV
RUN git clone http://github.com/johnsonyue/env
RUN mkdir $THESIS_ENV/temp/
COPY thesis_env.tar.gz.* $THESIS_ENV/temp/
WORKDIR $THESIS_ENV/env/analyze/
RUN cat $THESIS_ENV/temp/thesis_env.tar.gz.* | tar zxvf -
RUN rm -r $THESIS_ENV/temp/
##Vim.
ENV TERM=xterm-256color
COPY vimrc molokai.vim $THESIS_ENV
RUN mkdir -p ~/.vim/colors/
RUN cp vimrc ~/.vim/
RUN cp molokai.vim ~/.vim/colors

##Scamper.
WORKDIR scamper-cvs-20141211e/
RUN ./configure
RUN make
RUN make install
WORKDIR ../
RUN echo "include /usr/local/lib" >> /etc/ld.so.conf
RUN ldconfig
##bgpdump
WORKDIR bgpdump/
RUN ./bootstrap.sh && make && make install
WORKDIR ../

##IP2Location.
WORKDIR IP2Location-Python-master/ 
RUN python setup.py install
WORKDIR ../
##Maxmind
WORKDIR GeoIP2-python-master/ 
RUN python setup.py install
WORKDIR ../

#use default entrypoint: /bin/sh -c
CMD ["/bin/bash"]
