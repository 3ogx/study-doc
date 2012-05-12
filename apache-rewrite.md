## Rewrite

###### 按照请求头中的 `User-Agent:`重写站点首页

	RewriteEngine On
	RewriteCond %{HTTP_USER_AGENT} ^Mozilla.*
	RewriteRule ^/$ /homepage.max.html [L]

	RewriteCond %{HTTP_USER_AGENT} ^Lynx.*
	RewriteRule ^/$ /homepage.min.html [L]

	RewriteRule ^/$ /index.html [L]

###### RewriteBase
###### RewriteRule
* 引用
	1. RewriteRule 的反向引用 "$N"
	2. RewriteCond 的反向引用 "%N"

* apache rewrite环境变量
	1. %{HTTP_HOST}
	2. %{REQUEST_URI}
	3. %{REQUEST_FILENAME}
	4. %{SCRIPT_FILENAME}
	5. %{QUERY_STRING}
	6. %{DOCUMENT_ROOT}
	7. %{SERVER_POST}
	8. %{HTTP_USER_AGENT}
	9. 如果要匹配url中?之后的内容需要用%{query_string}
* 特殊形式
	1. %{HTTP:header} header是任何HTTP MIME的头名称,通过查找HTTP请求得到.

			%{HTTP:proxy-Connection}得到HTTP头`proxy-Connection:`的值

	2. %{LA-U:variable}
	3. %{LA-F:variable} 
	4. %{ENV:variable}

###### 正则表达式
1. (.) 任意一个单字符
1. (.?) 出现0次或者1次
1. (.*) 匹配 0或者多个
2. (.+) 至少要匹配1个
3. (txt|txt) 匹配其中的1个
4. ([a-zA-Z0-1]) 这个就不用讲了吧
5. ([^char]) 不在char里面
6.

###### mod_unique_id
	%{unique_id}e



# nginx 
* 正则表达式匹配
	1. (~*) 不区分大小写
	1. (~) 区分大小写
	1. (!~*) 
	1. (!~)
	1. (-f | !-f) 判断是否存在文件
	1. (-d | !-d) 判断是否存在目录
	1. (-e | !-e) 判断是否存在文件或目录
	1. (-x | !-x) 判断文件是否可执行
* flag标记
	1. last 完成
	1. break 终止匹配,不执行后面的内容
	1. redirect 返回302重定向
	1. permanent 301永久重定向
