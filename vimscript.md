###表 1. Vimscript 变量范围

<table border="0" cellpadding="0" cellspacing="0" class="ibm-data-table"><tbody><tr><td style="vertical-align:top">
						<strong>前缀</strong>
					</td><td style="vertical-align:top">
						<strong>含义</strong>
					</td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>g:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top">变量为全局变量 </td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>s:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 变量的范围为当前的脚本文件 </td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>w:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 变量的范围为当前的编辑器窗口</td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>t:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 变量的范围为当前的编辑器选项卡</td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>b:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 变量的范围为当前的编辑器缓冲区</td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>l:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 变量的范围为当前的函数</td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>a:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 变量是当前函数的一个参数  </td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>v:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 变量是 Vim 的预定义变量 </td></tr></tbody></table>
					

### 表 2. Vimscript 伪变量
<table border="0" cellpadding="0" cellspacing="0" class="ibm-data-table"><tbody><tr><td style="vertical-align:top">
						<strong>前缀</strong>
					</td><td style="vertical-align:top">
						<strong>含义</strong>
					</td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>&amp;</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 一个 Vim 选项（如果指定的话，则为本地选项，否则为全局选项） </td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>&amp;l:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 本地 Vim 选项 </td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>&amp;g:</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 全局 Vim 选项 </td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>@</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 一个 Vim 注册器 </td></tr><tr><td style="vertical-align:top">
						<strong>
							<em>$</em>
						</strong>
						<em>varname</em>
					</td><td style="vertical-align:top"> 一个环境变量 </td></tr></tbody></table>
					
### 表 3. Vimscript 运算符优先表
<table border="0" cellpadding="0" cellspacing="0" class="ibm-data-table"><tbody><tr><td style="vertical-align:top">
						<strong>运算</strong>
					</td><td style="vertical-align:top">
						<strong>运算符语法</strong>
					</td></tr><tr><td style="vertical-align:top"> 赋值<br>
                        数值相加并赋值<br> 数值相减并赋值<br>
                        字符串连接并赋值</td><td style="vertical-align:top">
						<strong>let</strong>
						<em>var</em>
						<strong>=</strong>
						<em>expr</em>
						<br>
						<strong>let</strong>
						<em> var</em>
						<strong>+=</strong>
						<em>expr</em>
						<br>
						<strong>let</strong>
						<em> var</em>
						<strong>-=</strong>
						<em>expr</em>
						<br>
						<strong>let</strong>
						<em> var</em>
						<strong>.=</strong>
						<em>expr</em>
					</td></tr><tr><td style="vertical-align:top"> 三元运算符 </td><td style="vertical-align:top">
						<em>bool</em>
						<strong>?</strong>
						<em>expr-if-true</em>
						<strong>:</strong>
						<em>expr-if-false</em>
					</td></tr><tr><td style="vertical-align:top"> 逻辑 OR </td><td style="vertical-align:top">
						<em>bool</em>
						<strong>||</strong>
						<em>bool</em>
					</td></tr><tr><td style="vertical-align:top"> 逻辑 AND </td><td style="vertical-align:top">
						<em>bool</em>
						<strong>&amp;&amp;</strong>
						<em>bool</em>
					</td></tr><tr><td style="vertical-align:top"> 数值或字符串相等<br>
                        数值或字符串不相等<br> 数值或字符串大于
                        <br> 数值或字符串大于等于<br>
                        数值或字符串小于<br> 数值或字符串小于等于</td><td style="vertical-align:top">
						<em>expr</em>
						<strong>==</strong>
						<em>expr</em>
						<br>
						<em>expr</em>
						<strong>!=</strong>
						<em>expr</em>
						<br>
						<em>expr</em>
						<strong>&gt;</strong>
						<em>expr</em>
						<br>
						<em>expr</em>
						<strong>&gt;=</strong>
						<em>expr</em>
						<br>
						<em>expr</em>
						<strong>&lt;</strong>
						<em>expr</em>
						<br>
						<em>expr</em>
						<strong>&lt;=</strong>
						<em>expr</em>
					</td></tr><tr><td style="vertical-align:top"> 数值相加<br> 数值相减<br> 字符串连接</td><td style="vertical-align:top">
						<em>num</em>
						<strong>+</strong>
						<em>num</em>
						<br>
						<em>num</em>
						<strong>-</strong>
						<em>num</em>
						<br>
						<em>str</em>
						<strong>.</strong>
						<em>str</em>
					</td></tr><tr><td style="vertical-align:top"> 数值相乘<br> 数值相除<br> 数值系数 </td><td style="vertical-align:top">
						<em>num</em>
						<strong>*</strong>
						<em>num</em>
						<br>
						<em>num</em>
						<strong>/</strong>
						<em>num</em>
						<br>
						<em>num</em>
						<strong>%</strong>
						<em>num</em>
					</td></tr><tr><td style="vertical-align:top"> 转换为数值<br> 求负数<br> 逻辑 NOT </td><td style="vertical-align:top">
						<strong>+</strong>
						<em>num</em>
						<br>
						<strong>-</strong>
						<em>num</em>
						<br>
						<strong>!</strong>
						<em>bool</em>
					</td></tr><tr><td style="vertical-align:top"> 括号优先 </td><td style="vertical-align:top">
						<strong>(</strong>
						<em>expr</em>
						<strong>)</strong>
					</td></tr></tbody></table>
					

[使用脚本编写 Vim 编辑器，第 1 部分: 变量、值和表达式](http://www.ibm.com/developerworks/cn/linux/l-vim-script-1/index.html?ca=drs-cn-0601)

[使用脚本编写 Vim 编辑器，第 2 部分: 用户定义函数](http://www.ibm.com/developerworks/cn/linux/l-vim-script-2/)
