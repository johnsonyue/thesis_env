FROM analyze

MAINTAINER johnsonyue version: 0.01

#replace default apt source & install necessary packages.
RUN apt-get update && apt-get install -y python-matplotlib python-mpltoolkits.basemap

#setup code env.
##source.
ENV HOME=/home/slide/
RUN mkdir -p $HOME
WORKDIR $HOME
RUN git clone http://github.com/johnsonyue/slide
RUN mkdir $HOME/temp/
COPY slide_env.tar.gz.* $HOME/temp/
RUN cat $HOME/temp/slide_env.tar.gz.* | tar zxvf -
RUN rm -r $HOME/temp/
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

#use default entrypoint: /bin/sh -c
CMD ["/bin/bash"]
