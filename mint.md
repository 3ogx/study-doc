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
#### 把home下的中文设置为英文
    1. 在终端输入 `export LANG=en_US`
    2. xdg-user-dirs-gtk-update
    3. export LANG=zh_TW
#### 用egreb查找文件
	egreb -ir "(filename|filename)" path
	
#### 让你提升命令行效率的 Bash 快捷键 

编辑命令

	Ctrl + a ：移到命令行首
	Ctrl + e ：移到命令行尾
	Ctrl + f ：按字符前移（右向）
	Ctrl + b ：按字符后移（左向）
	Alt + f ：按单词前移（右向）
	Alt + b ：按单词后移（左向）
	Ctrl + xx：在命令行首和光标之间移动
	Ctrl + u ：从光标处删除至命令行首
	Ctrl + k ：从光标处删除至命令行尾
	Ctrl + w ：从光标处删除至字首
	Alt + d ：从光标处删除至字尾
	Ctrl + d ：删除光标处的字符
	Ctrl + h ：删除光标前的字符
	Ctrl + y ：粘贴至光标后
	Alt + c ：从光标处更改为首字母大写的单词
	Alt + u ：从光标处更改为全部大写的单词
	Alt + l ：从光标处更改为全部小写的单词
	Ctrl + t ：交换光标处和之前的字符
	Alt + t ：交换光标处和之前的单词
	Alt + Backspace：与 Ctrl + w 相同类似，分隔符有些差别 
	
重新执行命令

	Ctrl + r：逆向搜索命令历史
	Ctrl + g：从历史搜索模式退出
	Ctrl + p：历史中的上一条命令
	Ctrl + n：历史中的下一条命令
	Alt + .：使用上一条命令的最后一个参数
	
控制命令

	Ctrl + l：清屏
	Ctrl + o：执行当前命令，并选择上一条命令
	Ctrl + s：阻止屏幕输出
	Ctrl + q：允许屏幕输出
	Ctrl + c：终止命令
	Ctrl + z：挂起命令
	
Bang (!) 命令

	!!：执行上一条命令
	!blah：执行最近的以 blah 开头的命令，如 !ls
	!blah:p：仅打印输出，而不执行
	!$：上一条命令的最后一个参数，与 Alt + . 相同
	!$:p：打印输出 !$ 的内容
	!*：上一条命令的所有参数
	!*:p：打印输出 !* 的内容
	^blah：删除上一条命令中的 blah
	^blah^foo：将上一条命令中的 blah 替换为 foo
	^blah^foo^：将上一条命令中所有的 blah 都替换为 foo