* Thesis Env:
  * Maxmind Geoip2lite
  * CZDB(qqwry)
  * IP2Location

* To split:

	tar zcvf - thesis_env/ | split -d -a 1 -n 4 - thesis_env.tar.gz.
	
* To combine:
	
	cat thesis_env.tar.gz.* > thesis_env.tar.gz
