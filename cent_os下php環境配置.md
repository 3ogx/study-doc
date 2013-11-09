# cent os下 PHP環境配置
====
### apache 安裝
	tar zxvf /home/lamp/httpd-5.0.9.tar.gz
	./configure --prefix=/usr/local/apache2 --enable-so --enable-deflate --enable-rewrite --with-mem=worker
	make 
	make install

### 依賴庫安裝
	yum list libpng
	yum list libjpeg
	yum list freetype
	yum list libpng-devel
	yum list libjpeg-devel
	yum list freetype-devel
	yum list gd
	yum list gd-devel


### mysql安裝
	tar jxvf mysql-X.x.x-i686.X
	groupadd mysql
	useradd -g mysql mysql
	cd /usr/local/mysql
	chown mysql .
	chgrp mysql .
	scripts/install-db --user=mysql &
	chown root .
	chown mysql data
	bin/mysqld_safe --user=mysql

	## 拷贝surport-files/my-*.cnf /etc/my.cnf
	cp suport-files/mysql.server /etc/init.d/mysql
	/etc/init.d/mysql start | stop | restart


### PHP 安裝
	tar zxvf php-5.2.6.tar.gz
	./configure --prefix=/usr/local/php --enable-fastcgi --with-zlib --with-iconv --enable-sockets --with-openssl --with-gd --with-libpng --with-libjpeg --with-freetype --with-curl --with-mbstring --with-mysql=/usr/local/mysql/ --with-pdo-mysql=/usr/local/mysql/ --with-xml --with-simplexml
	make
	make install

## 安装memcached需要libevent
	wget http://www.monkey.org/~provos/libevent-1.4.9-stable.tar.gz
	tar zxvf 
	./configure
	make 
	make install

## memcached (內存緩存服務器,目前大部分網站在用)
	./configure --prefix=/usr/local/memcached --with-php-config=/usr/local/php/bin/php-config
	make
	make install

	需要编辑/etc/ld.so.conf 加入/usr/lib然后是用/sbin/ldconfig 生效，如果还继续提示
	ln -s /usr/local/lib/libevent-1.4.so.2 /usr/lib/libevent-1.4.so.2
	使用下面命令启动memcached
	/usr/local/memcached/bin/memcached -l 192.168.1.20 -c 64 -M 64 -u nobody -p 11211


	memcache
	/usr/local/php/bin/phpize
	./configure --enable-debug --enable-shared --with-php-config=/usr/local/php/bin/php-config --with-zlib
	make
	make install

## eaccelerator (PHP的加速器,文件緩存用的,可以選擇不安裝)
	./configure --enable-shared --with-php-config=/usr/local/php/bin/php-config --with-eaccelerator-debug 
	make 
	make install
	mkdir /tmp/eaccelerator
	chmod 777 /tmp/eaccelerator


	mkdir /usr/local/php/ext
	ln -s /usr/local/php/lig/php/extension/no-debug-xxxx/memcache.so /usr/local/php/ext/memcache.so
	ln -s /usr/local/php/lig/php/extension/no-debug-xxxx/eaccelerator.so /usr/local/php/ext/eaccelerator.so

## 配置php(vi /usr/local/php/lib/php.ini)
	[memcache]
	extension="memcache.so"

	[eaccelerator]
	extension="eaccelerator.so"
	eaccelerator.shm_size="16"
	eaccelerator.cache_dir="/tmp/eaccelerator"
	eaccelerator.enable="1"
	eaccelerator.optimizer="1"
	eaccelerator.check_mtime="1"
	eaccelerator.debug="0"
	eaccelerator.filter=""
	eaccelerator.shm_max="0"
	eaccelerator.shm_ttl="0"
	eaccelerator.shm_prune_period="0"
	eaccelerator.shm_only="0"
	eaccelerator.compress="1"
	eaccelerator.compress_level="9"


## 安装apache扩展(服務器安全用,內部服務器可以不用安裝)
	mod_evasive
	modsecurity
	/usr/local/apache2/bin/apxs -c -i -a mod_evasive2.c
	/usr/local/apache2/bin/apxs -c -i -a apache2/mod_security.c

	vi /usr/local/apache2/conf/mod_evasive.conf
	<IfModule mod_evasive20.c>
		DOSHashTableSize 3097
		DOSPageCount 10
		DOSSiteCount 100
		DOSPageInterval 5
		DOSSiteInterval 5
		DOSBlockingPeriod 10
	</IfModule>

	vi /usr/local/apache2/conf/security.conf
	<IfModule mod_security.c>
		SecFilterEngine On
		SecFilterCheckURLEncoding On
		SecFilterDefaultAction "deny,log,status:500"
		#SecFilterForceByteRange 48 255
		#SecFilterScanPOST On
		#SecAuditLog logs/audit_log
		CustomLog logs/modsec_custom_log "%h %l %u %t \"%r\" %>s %b %{mod_security-message}i" env=mod_security-relevant
		
		###
		SecFilter "\.\./"
		####
		SecFilter /etc/*passwd
		SecFilter /bin/*sh
		
		#for css attack
		SecFilter "<( | )*script"
		SecFilter "<(.| )+>"
		#for sql attack
		SecFilter "delete[[:space:]]+from"
		SecFilter "insert[[:space:]]+into"
		SecFilter "update[[:space:]]+into"
		SecFilter "select.+from"
		#
		SecFilter "\'"
		SecFilter "\""
	</IfModule>


## 配置apache
	fcgid
	LoadModule fcgid_module modules/mod_fcgid.so
	LoadModule evasive20_module   modules/mod_evasive20.so
	LoadModule security_module    modules/mod_security.so

	Include conf/mod_evasive.conf
	Include conf/security.conf
	
	fcgid:
	AddHandler fcgid-script .php
	<Directory /home/htdocs>
    	FCGIWrapper /usr/local/php/bin/php-cgi .php
	    Options ExecCGI
	    allow from all
	</Directory>
	IdleTimeout 600
	IPCCommTimeout 2000
	DefaultMaxClassProcessCount 100000
	SpawnScoreUpLimit 50000

## 虚拟主机
	DocumentRoot /home/htdocs
	<Directory /home/htdocs>
	</Directory>

	NameVirtualHost 192.168.1.20:80
	<VirtualHost 192.168.1.20:80>
	   DocumentRoot /home/htdocs
	   ServerName localhost
	</VirtualHost>


## cent OS 更新命令
### yum的一切配置信息都储存在一个叫yum.conf的配置文件中，通常位于/etc目 录下，这是整个yum系统的重中之重，

* cachedir：yum缓存的目录，yum在此存储下载的rpm包和数据库，一般是/var/cache/yum。

	* 列出所有可更新的软件清单
		
		命令：`yum check-update`
	
	* 安装所有更新软件
	
		命令：`yum update`
		
	* 仅安装指定的软件
	
		命令：`yum install`
		
	* 仅更新指定的软件
	
		命令：`yum update`
	
	* 列出所有可安裝的软件清单
	
		命令：`yum list`



` 有时我们还会碰到安装了一个包，但又不知道其用途，我们可以用yum info packagename这个指令来获取信息。`

* 使用YUM查找软件包

	命令：`yum search `

* 列出所有可安装的软件包

	命令：`yum list`

* 列出所有可更新的软件包

	命令：`yum list updates`

* 列出所有已安装的软件包

	命令：`yum list installed`

* 列出所有已安装但不在 Yum Repository 內的软件包

	命令：`yum list extras`

* 列出所指定的软件包

	命令：`yum list`

* 使用YUM获取软件包信息

	命令：`yum info` 

* 列出所有软件包的信息

	命令：`yum info`

* 列出所有可更新的软件包信息

	命令：`yum info updates`

* 列出所有已安裝的软件包信息

	命令：`yum info installed`

* 列出所有已安裝但不在 Yum Repository 內的软件包信息

	命令：`yum info extras`
