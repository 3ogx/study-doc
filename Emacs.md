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

###### 替換
	M-x query-replace
	M-%

###### 搜索內容
	M-x rgrep

###### 保存文件時清空多餘的空格

	(add-hook 'before-save-hook
		'(lambda()
			(whitespace-cleanup)))

###### 模糊查找一個Command的幫助
	M-x apropos

###### 使用etags快速查找
	etags -ai `find ./ -name "*.php"`
	M-x visit-tag-table
	M-x tags-reset-tags-table
	M-.
	C-u M-.


##### 保存文件时自动删除多余的空格
	(add-hook 'local-write-file-hooks
		'(lambda()
			(whitespace-cleanup)))
###### M-u 整个单词大写
###### M-c 首字母大写
###### M-I 全部改为小写
###### M-t 交换整个单词
###### C-t 交换单个字母
###### C-x C-t 交换整行
###### C-x C-x 快速切换
###### M-w
###### M-W
###### C-K
###### M-m
###### 蘋果下設置字體
    (set-default-font "-apple-monaco-medium-r-normal--16-140-72-72-m-140-mac-roman")

###### mac下綁定`Command`為M

    (setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    (setq mac-command-modifier t)
    (setq mac-option-modifier nil)


#### link
* [王垠](http://docs.huihoo.com/homepage/shredderyin/links.html)
* [王纯业](http://ann77.emacser.com/)
* [Emacs中文网](http://emacser.com/)

\]r[ereoetowtjw jijl4ªº“£4903”]
