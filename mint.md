## Mint

### Linux 少用的命令
#### 1.使用`pgrep`快速查找一个PID
	pgrep ssh

#### 2.执行上次执行过的命令 `!!`
	!!

#### 3.执行最近一次以XX开头的命令 `!`
	!co

#### 4.反复执行一个命令并在屏幕上输出 `watch`
	watch -d ls -l

#### 5.在VI中快速保存
	[shift+zz]

#### 6.快速登出终端
	CTRL+d

#### 7.返回你上一个所在的目录 `cd -`
	cd -

#### 8.聪明地创建父目录 `mkdir -p`
	mkdir -p

#### 9.删除一整行
	CTRL+U

#### 10. 设置文件的时间戳
	touch -c -t 0801010800 filename.c // 日期格式(YYMMDDhhmm)

#### 访问上一个命令的最后一个参数 `$_`
	1. cp somefile.ht /home/xx/xx
