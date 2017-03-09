* Thesis Env:
  * Maxmind Geoip2lite
  * CZDB(qqwry)
  * IP2Location

* To split:

	tar zcvf - thesis_env/ | split -d -a 1 -b 25MB - thesis_env.tar.gz.
	
* To combine:
	
	cat thesis_env.tar.gz.* > thesis_env.tar.gz

* To download:
	
	wget https://codeload.github.com/johnsonyue/thesis_env/zip/master
