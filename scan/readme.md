##requires base image ubuntu:14.04
 * newer version of ruby uses RbConfig instead of Config,
 * which makes gem not backward compatible with old '.gem' package.

##to build ubuntu:14.04
 * 
		root# git clone https://github.com/tianon/docker-brew-ubuntu-core.git
		root# ./update.sh
		
		or use the tar in this repository
		
		root# cd ../trusty/
		root# docker build -t ubuntu:14.04 .
