# Emacs 操作讨巧
----

###### 快速查找内容
> M-x occur RET 要查找的内容

###### 拷贝当前行
> M-x copy-line-down

###### 格式化代码
> M-x indent-region

###### 移动到当前不包含空格的行首

> M-a 

###### 

> M-e 

######  发送MAIL 

> C-m o 

###### 查找GIT项目文件
> C-x c 

###### 最近打开的文件
> (global-set-key (kbd "C-c C-r") 'recentf-open-files)
> C-c C-r 

##### 保存文件时自动删除多余的空格
	(add-hook 'local-write-file-hooks
		'(lambda()
			(whitespace-cleanup)))

#### link
* [王垠](http://docs.huihoo.com/homepage/shredderyin/links.html)
* [王纯业](http://ann77.emacser.com/)
* [Emacs中文网](http://emacser.com/)