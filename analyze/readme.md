* analyze/thesis_env.tar.gz:
  * Maxmind Geoip2lite (lib & db)
  * CZDB(qqwry) (lib & db)
  * IP2Location (lib & db)
  * Scamper (source)

* To split:

	tar zcvf - thesis_env/ | split -d -a 1 -b 25MB - thesis_env.tar.gz.
	
* To combine:
	
	cat thesis_env.tar.gz.* > thesis_env.tar.gz
