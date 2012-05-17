## 20120511 

#### 开放平台部署
######  apache 配置

	<VirtualHost *>
		DocumentRoot "Open_PHP"
		ServerName open.idkin.net
		
		RewriteEngine On
		RewriteCond %{QUERY_STRING} ^r=soft/soft(.*)$
		RewriteRule ^/index\.php$ http://soft/index.php?r=soft/soft%1 [L]
	</VirtualHost>

> QUERY_STRING 匹配代`?`的字串 

> `r=soft/soft(.*)` 这句匹配的`(.*)`在下文引用时用`%1`

> 如果在后面加 [QSA] 则会加上所有的`query_string`,会出现下面的情况(重复的querystring)
	http://soft/index.php?r=soft/soft&r=soft/soft

> 但是使用[QSA],在soft中则不能匹配`r=soft/soft`

	<Virtualhost *>
		DocumentRoot "Open_PHP/"
		ServerName soft.idkin.net

		RewriteEngine On
		# 从open转过来的url指向soft
		RewriteRule %{QUERY_STRING} /index.php?%1 [L]
		# 下面这句是把soft.idkin.net指向 软件+
		RewriteRule ^/$ /index.php?r=soft/soft [L]
		
		# 把非软件+的url指回开放平台
		RewriteCond %{QUERY_STRING} !^r=soft/soft(.*)$
		RewriteRule ^(.*)$ http://open.idkin.net$1%1 [QSA,L]
	</VirtualHost>

###### nginx 配置

	server {
		listen 80;
		server_name open.idkin.com
		index index.html index.php index.htm
		root /web_root/Open_PHP;

		location /{
			autoindex on;
		}

		if ($query_string ~* ^r=soft/soft(.*)$) {
			# rewrite ^index.php$ http://soft.idkin.com/index.php?r=soft/soft%1 last;
			rewrite ^/ http://soft.idkin.com/index.php? last;
		}
	}

	server {
		listen 80;
		server_name soft.idkin.com
		index index.html index.php index.htm
		root /web_root/Open_PHP;

		location / {
			allow all;
			autoindex on;
		}

		rewrite on;
		if ($host ~* ^soft.idkin.com$) {
			# rewrite $query_string /index.php?$args --break-- last;
			rewrite $query_string /index.php?$args last;
			rewrite ^/$ /index.php?r=soft/soft last;
			set $need_rewrite 'o';
		}

		if ($query_string !~* ^r=soft/soft(.*)$) {
			set $need_rewrite '${need_rewrite}k';
			# --rewrite ^(.*)$ http://open.idkin.com/$1%1 permanent;--
		}

		if ($need_rewrite = 'ok') { // 顺序不能变
			rewrite ^/ http://open.idkin.com/index.php parmanent;
		}
	}
