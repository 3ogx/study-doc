# git

### 初始化版本
	git init
	git add .
	git add some
	git commit

> 初次使用`git`记得使用下面命令配置

	git config --global user.name '3ogx'
	git config --global user.email 'webmaster@3ogx.com'

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
	git log --format=full // 查看日志详细信息
	git log --pretty=short // 'short|full|email|raw|fuller'
	git log --pretty=format:'%h was %an, message: %s'
	git log --pretty=format:'%h was %an, message: %s' --graph // 图像显示日志
	git log HEAD..c
	git show
	git show HEAD	// 查看当前分支
	git show HEAD^	// 查看HEAD的父母的信息
	git show HEAD^^	// 查看HEAD的父母的父母的信息
	git show HEAD~4	// 查看HEAD上溯4代的信息

	// 以下情况是因为`git merge`产生两个父母
	git show HEAD^1	// 查看第一个父母信息
	git show HEAD^2	// 查看第二个父母信息
	
###### 日志排序
	git log ordering
	git log --pretty=format:'%h was %an, message: %s' --topo-order --graph // 拓扑显示日志
	git log --pretty=format:'' --date-order --graph
	git log --pretty=format:'' --revers //逆向显示所有日志
	
###### 交互式提交
	git add -i
	
###### 储存
	git stash		// 保存修改到储存中
	git stash apply	// 回复原来的修改
	git stash list  // 查看储存队列
	git stash clear // 清空储存队列

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
	git diff -- filename

###### git format-patch 
	git format-patch origin // 生成一个补丁文件，当前文件和HEAD的差异内容
	git send-mail
	git am -3 patchname.patch 
	// 向项目中导入补丁, Git会按照顺序应用每一个补丁; 如果发生了冲突, git会停下来让你手工解决冲突从而完成合并. ("-3"选项会让git执行合并操作; 如果你更喜欢中止并且不改动你的工作树和索引, 你可以省略"-3"选项.)
	git am --resolve // 这时git会为你创建一个提交, 然后继续应用mailbox中余下的补丁
	
###### git reset -head 
###### git checkout -- filename 恢复一个文件
###### git whatchanged -P master...v3


## 自定义 git 

	git config --global user.name "3ogx"
	git config --global user.email "3ogx.com@gmail.com"

上面两行代码会产生`.gitconfig` 文件，格式如下：

	[user]
	name = 3ogx
	email = 3ogx.com@gmail.com
	
#### 更改默认的编辑器
	git config --global core.editor emacs

#### 添加别名
	git config --global alias.last 'cat-file commit HEAD'

#### 添加颜色
	git config color.ui true
#### 提交模板
	git config commit.template '~/.gittemplate'
	
## git 高级操作
#### 查找问题
###### git bisect 查找版本
	git bisect start
	git bisect good version
	git bisect bad version

###### git blame 查看文件的每个部分是谁修改的
	git blame -n filename

###### git alias 创建别名
	git config --global alias.ci commit

可以直接编辑**~/.gitconfig**来增加别名

	[Alias]
	st = status
	ci = commit
	co = checkout
	br = branch
	ls = ls-tree --name-only HEAD
	lf = log --format=full
	lp = log --pretty=short
	

## git hooks

## Q&A
#### linux 下使用`git push`出现下面的问题

	perl: warning: Setting locale failed.
	perl: warning: Please check that your locale settings:
		LANGUAGE = "en_US:EN",
		LC_AL = (unset),
		LC_MESSAGES = "zh_TW.UTF-8",
		LC_COLLATE = "zh_TW.UTF-8",
		LC_CTYE = "zh_TW.UTF-8",
		LANG = "en_US.UTF-8"
	are supported and installed on your system.
	perl: warning: Falling back to the standard locale("C")

编辑 ~/.bashrc 加入下面几句:

	export LANG = "zh_TW.UTF-8"
	export LC_ALL = C

保存退出

	source ~/.bashrc


#### 如果本地修改版本不稳定,可以使用stash
	git stash
	git pull
	git stash pop
	git stash aplay
#### git remote show orig


![git Data Transport Commands](http://roclinux.cn/wp-content/uploads/2010/12/git-transport.png)
	
## git 分支 
* 建立中心版本库,保留两个分支`master`和`develop`
	1. master 保持发布版本
	2. develop 为开发版本
* 再增加辅助分`feature` `release` `hotfix`
![git branches](http://roclinux.cn/wp-content/uploads/2010/12/bigpicture-git-branch-all.png)

	1. feature 管理功能开发
		* feature branches 起源于 develop, merge develop
	![feature branches](http://nvie.com/img/2009/12/fb.png)
	2. release 帮助构建可发布代码
		* release branches 起源于 develop, merge develop or master
		* 建议命名为“release-*”
		* 通常负责“短期的发布前准备工作”、“小bug的修复工作”、“版本号等元信息的准备工作”。与此同时，“develop”分支又可以承接下一个新功能的开发工作了
		* 在一段短时间内，在“Release branches”上，我们可以继续修复bug。在此阶段，严禁新功能的并入，新功能应该是被合并到“develop”分支的
		* 经过若干bug修复后，“Release branches”上的代码已经达到可发布状态，此时，需要完成三个动作：第一是将“Release branches”合并到“master”分支，第二是一定要为master上的这个新提交打TAG（记录里程碑），第三是要将“Release branches”合并回“develop”分支。
	3. hotfix 可以便捷修复发布版本关健Bug
		* “Hotfix branches”源于“master”，归于“develop”或“master”，通常命名为“hotfix-*”
		* 希望避免“develop分支”新功能的开发必须为BUG修复让路的情况
		* BUG修复后，需要将“Hotfix branches”合并回“master”分支，同时也需要合并回“develop”分支
	![hotfix branches](http://nvie.com/img/2010/01/hotfix-branches1.png)


![git](http://nvie.com/img/2009/12/Screen-shot-2009-12-24-at-11.32.03.png)

[git branches](http://nvie.com/posts/a-successful-git-branching-model/)

## git 2 svn
#### 将本地的git库导入svn(不丢失日志)
	git svn init svn://server/respo/dir
	git svn fetch
	git rebase git-svn
	git svn dcommit
