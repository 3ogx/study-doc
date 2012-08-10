# MacOS
## 

### Install`php5.4`
	curl -s http://php-osx.liip.ch/install.sh | bash -s 5.4
	
### Uninstall
	vi /etc/apache2/httpd.conf
	# LoadModule php5_module /usr/local/php5/libphp5.so
	LoadModule php5_module libexec/apache2/libphp5.so
	
	
#### 執行pecl，出現Could not open input file: /usr/lib/php/peclcmd.php的問題

* 檢查 /usr/lib/php 發現確實沒有peclcmd.php,發現該文件因為安裝了php5.4，跑到了/usr/local/php5/lib/php/目錄下。
* 在/usr/lib/php/下建立符號鏈接
* 在.bash_profile加入命令別名
 

		ln -s /usr/local/php5/lib/php/peclcmd.php /usr/lib/php/peclcmd.php
		vi .bash_profile
		alias pecl="/usr/bin/php /usr/lib/php/peclcmd.php";
		
		ln -s /usr/local/php5/lib/php/pearcmd.php /usr/lib/php/pearcmd.php
		alias pear="/usr/bin/php /usr/lib/php/pearcmd.php";
		

* http://php-osx.liip.ch