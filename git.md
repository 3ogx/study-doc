# git

### 初始化版本
	git init
	git add .
	git add some
	git commit

#### 分支
###### 创建分支
	git checkout -b branchename
###### 切换分支c
	git checkout branchename
###### 合并分支
	git checkout master
	git pull .
	git merge

>  使用`git pull .` 可以踢代 `git merge` 命令。`git pull`可能会因为目录权限被拒绝, 可以用 `chmod 0+xw`解决.

###### 提取修改内家
如果只提取分支修改的内容,可使用 `git fetch branchname`

	cd myRes/
	git fetch branchname master:newbranch
	git whatchanged -p master..branchname
	git checkout master
	git pull . newbranch
	git branch -D newbranch

###### 删除分支
	git branch -d branchname // 分支已提交，安全删除分支
	git branch -D branchname // 分支开发失败， 放弃并删除分支

###### 查看日志
	git log
	git log HEAD..c
	git show
	git show HEAD	// 查看当前分支
	git show HEAD^	// 查看HEAD的父母的信息
	git show HEAD^^	// 查看HEAD的父母的父母的信息
	git show HEAD~4	// 查看HEAD上溯4代的信息

	// 以下情况是因为`git merge`产生两个父母
	git show HEAD^1	// 查看第一个父母信息
	git show HEAD^2	// 查看第二个父母信息

###### 标签
`git tag`

	git tag V3 5b887
	git show V3
		=> git show 5b887
	git branch stable V3
		=> git bransh stable 5b887

###### 搜索
`git grep`

	git grep 'needs' 		// 查找所有记录
	git grep 'needs' tag	// 在 tag 中查找 

## basic repository

	git init	// 
	git fsck	// 检查仓库的错误
	git gc		// 
	git clone	//

###### git clone
	rsync://host.xz/path/to/repo.git/
	http://host.xz/path/to/repo.git/
	https://host.xz/path/to/repo.git/
	git://host.xz/path/to/repo.git/
	ssh://[user@]host.xz[:port]/path/to/repo.git/
	file:///path/to/repo.git/
	/path/to/repo.git/


#### 小结
* commit 和 commit -a 的区别
	+ commit -a 
		- 自动地add所有改动代码,使所有开发代码列于index file中
		- 自动地删除在index file中但不在工作树中的文件
		- 执行commit提交
* log -p 中 -p 的作用
	+ git log: 显示commit是志
	+ git log -p: 不仅显示commit是志,而且同时显示每次commit的代码改变
* merge的用法及参数的用法
>	当你希望撤消一个分支到merge之前的状态时可以使用
	
		`git ret -hard HEAD	// -hard表示将 working tree 和 index file都撤消到以前状态`
		* soft表示只撤消commit, 保留working tree 和index file 
		* mixed 会撤消commit 和 index file, 保留working tree

* fetch的用法
> 从另一个reposoitory下载objects和refs

	`git fetch <options> <reposoitory> <refspec>`
	+ `reposoitory 远端的仓库`
	+ `refspec的标准格式: <src>:<dsc>` src 表示源分支,dsc不为空表示当地的分支,为空表示当前的分支.

* pull的用法
* HEAD 的含义及相关用法, ORIG_HEAD的使用方法
* tag的用法 

###### git diff
+ working tree 工作目录,每当修改了代码,状态改变
+ index file 索引文件,连接working tree 和 commit的桥梁, git-add 登记后 index file 改变, 和 working tree 同步.
+ commit commit之后,代码才真正进入git仓库.

> 
	git diff 	// 查看working tree 和 index file的差别
	git diff --cached	// 查看index file  和 commit 差别的
	git diff HEAD	// 查看working tree 和 commit差别的

###### git format-patch 
###### git reset -head 
