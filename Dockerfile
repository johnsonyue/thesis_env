FROM ubuntu:latest

MAINTAINER johnsonyue version: 0.01

#replace default apt source & install necessary packages.
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim git tar python python-setuptools

#setup code env.
##source.
ENV THESIS_ENV=/home/thesis_env/
RUN mkdir -p /home/thesis_env
WORKDIR $THESIS_ENV
RUN git clone http://github.com/johnsonyue/thesis_analyzer
VOLUME $THESIS_ENV/temp
COPY thesis_env.tar.gz.* $THESIS_ENV/temp/
WORKDIR $THESIS_ENV/thesis_analyzer/analyzer/
RUN cat $THESIS_ENV/temp/thesis_env.tar.gz.* | tar zxvf -
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
