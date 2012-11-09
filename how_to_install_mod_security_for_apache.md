# How to install mod_security for apache

## 什么是mod_security?

modsecurity 是一个开源的入侵检测和防禦引擎的web應用.

## Install

	wget http://www.modsecurity.org/download/mod_security-1.7.4.tar.gz
	tar zxvf mod_security-1.7.4.tar.gz
	cd mod_security-1.7.4
	apxs -cia mod_security.c
	vi http.conf
	
	
	
	<IfModule mod_security.c>
		SecFilterEngine On

		SecServerSignature "Apache"
		SecFilterCheckUnicodeEncoding Off
		SecAuditEngine RelevantOnly
		SecAuditLog logs/audit_log
		SecFilterScanPOST On

		SecFilterDefaultAction "deny,log,status:403"

		SecFilterSelective REQUEST_METHOD "^POST$" chain
		SecFilterSelective HTTP_Content-Length "^$"

		SecFilterSelective HTTP_Transfer-Encoding "!^$"

		SecFilterSelective ARG_PHPSESSID "!^[0-9a-z]*$"
		SecFilterSelective COOKIE_PHPSESSID "!^[0-9a-z]*$"
		SecFilter "../"

		SecFilter "viewtopic\.php\?" chain
		SecFilter "chr\(([0-9]{1,3})\)" "deny,log"

		SecFilterSelective THE_REQUEST "wget "
		SecFilterSelective THE_REQUEST "lynx "
		SecFilterSelective THE_REQUEST "scp "
		SecFilterSelective THE_REQUEST "ftp "
		SecFilterSelective THE_REQUEST "cvs "
		SecFilterSelective THE_REQUEST "rcp "
		SecFilterSelective THE_REQUEST "curl "
		SecFilterSelective THE_REQUEST "telnet "
		SecFilterSelective THE_REQUEST "ssh "
		SecFilterSelective THE_REQUEST "echo "
		SecFilterSelective THE_REQUEST "links -dump "
		SecFilterSelective THE_REQUEST "links -dump-charset "
		SecFilterSelective THE_REQUEST "links -dump-width "
		SecFilterSelective THE_REQUEST "links http:// "
		SecFilterSelective THE_REQUEST "links ftp:// "
		SecFilterSelective THE_REQUEST "links -source "
		SecFilterSelective THE_REQUEST "mkdir "
		SecFilterSelective THE_REQUEST "cd /tmp "
		SecFilterSelective THE_REQUEST "cd /var/tmp "
		SecFilterSelective THE_REQUEST "cd /etc/httpd/proxy "
		SecFilterSelective THE_REQUEST "/config.php?v=1&DIR "
		SecFilterSelective THE_REQUEST "/../../ "
		SecFilterSelective THE_REQUEST "&highlight=%2527%252E "
		SecFilterSelective THE_REQUEST "changedir=%2Ftmp%2F.php "

		# 防SQL注入攻擊
		SecFilter "delete[[:space:]]+from"
		SecFilter "insert[[:space:]]+into"
		SecFilter "select.+from"

		# 跨站攻擊
		SecFilter "<[[:space:]]*script"

		# Prevent XSS atacks (HTML/Javascript injection)
		SecFilter "<(.|n)+>"
	</IfModule>