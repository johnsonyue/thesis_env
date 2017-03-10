FROM analyze

MAINTAINER johnsonyue version: 0.01

#replace default apt source & install necessary packages.
RUN sed -i 's/archive.ubuntu.com/debian.ntsc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y vim git tar python

#setup code env.
ENV HOME=/home/slide/
ENV ANALYZE=/home/thesis_env/env/analyze/
RUN git clone http://github.com/johnsonyue/slide
WORKDIR $HOME

RUN cp $ANALYZE/GeoLite2-City.mmdb $ANALYZE/IP2LOCATION-LITE-DB11.BIN $ANALYZE/qqwry.dat .
RUN mkdir temp/
COPY thesis_env.tar.gz.* temp/
RUN cat temp/thesis_env.tar.gz.* | tar zxvf -
RUN rm -r temp/


##Vim.
ENV TERM=xterm-256color
COPY vimrc molokai.vim $CWD
RUN mkdir -p ~/.vim/colors/
RUN cp vimrc ~/.vim/
RUN cp molokai.vim ~/.vim/colors

#use default entrypoint: /bin/sh -c
CMD ["/bin/bash"]
