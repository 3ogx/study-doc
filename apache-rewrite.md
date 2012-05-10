## apache Rewrite

###### 按照请求头中的 `User-Agent:`重写站点首页

	RewriteEngine On
	RewriteCond %{HTTP_USER_AGENT} ^Mozilla.*
	RewriteRule ^/$ /homepage.max.html [L]

	RewriteCond %{HTTP_USER_AGENT} ^Lynx.*
	RewriteRule ^/$ /homepage.min.html [L]

	RewriteRule ^/$ /index.html [L]

###### RewriteRule
###### mod_unique_id
	%{unique_id}e