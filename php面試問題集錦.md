# php問題集錦

### fastcgi 和 cgi有什麼區別
	
CGI全称是“公共网关界面”(Common Gateway Interface)
	
CGI处理步骤：
	
	⑴通过Internet把用户请求送到服务器。

	⑵服务器接收用户请求并交给CGI程序处理。

	⑶CGI程序把处理结果传送给服务器。

	⑷服务器把结果送回到用户。
		
CGI技术的性能缺陷：

* 每当服务器收到一个对CGI程序请求时，服务器都将创建一个CGI程序的进程，CGI程序处理完请求后，将输出发给服务器或直接传回客户端，然后终止。

* fastCGI 对CGI技术进行了改良，一个fastCGI进程在WEB服务器启动时或在客户端第一次请求时创建，它处理完客户端请求后并不终止，而是等待处理下一个请求。另外fastCGI程序与CGI程序与服务器的交互方式也不同，CGI程序通过环境变量、命令行、标准输入输出进行交互，因此CGI程序进程必须与服务器进程在同一台物理计算机上，而fastCGI程序与服务器进程通过网络连接交互，因此fastCGI程序可以分布在不同的计算机上，这不但可以提高性能，同时也提高了系统的扩展能力。
	
	http://www.niutian365.com/blog/article.asp?id=263
	
### memcache內存分配

	* page
	* trunk
	* slab

### NoSQL
### Node.js

### 二分法查找

* 只適用於順序存儲的結構.
* 非遞歸算法

		function binarySearch($list, $n, $need) {
			$low  = 0;
			$high = $n - 1;
			
			while ($low < $high) {
				$mid = ($low + $high)/2;
			
				if ($list[$mid] == $need) {
					return $mid;
				}
				
				if ($need > $list[$mid]) {
					$low = $mid + 1;
				} else {
				    $high = $mid - 1;
				}
			}
			return -1;
		}
		
* 遞歸算法
	
		function binarySearch($list, $need, $low, $high) {
			if ($low > $high) {
				return -1;
			}
			
			$mid = ($low + $high)/2;
			
			if ($list[$mid] == $need) {
				return $mid;
			} else if ($list[$mid] > $need) {
				return binarySearch($list, $need, $low, $mid - 1);
			} else {
				return binarySearch($list, $need, $mid + 1, $high);
			}
		}

### KMP排序

		function kmp($string, $pattern) {
			$patternLen = strlen($parttern);
			$stringLen  = strlen($string);
			$patternArr = str_split($pattern);
			// $patternLen = size($pattern)
			
			$k = 0;
			for ($i =0; $i < $patternLen; ++$i) {
				while ($k > 0 && $pattern[$i] != $pattern[$k]) {
					$k = $patternArr[$k - 1];
				}
				
				if ($pattern[$i] == $pattern[$k]) {
						$k++;
				}
				$patternArr[$i] = $k;
			}
		}

### post 和 get的區別

	* get 从服务器取数据, post向服务器传送数据
	* get 把所有参数队列加入提交表单action所指的url，值和参数一一对应，在url可以看到。
	* post 将表单内各个字段和值放置在html header内一起传输到action所指的url
	* get  服务器端用Request.QueryString获取变量的值, post Request.Form获取提交的数据
	* get 传输数据量不大于2kb，受url的限制。post传输数据量大（默认不受限制），理论上iis4中最大为80kb，iis5中100kb。
	* get 安全性低，post安全性高，但get执行效率要高于post
	* 做数据查询时实用get，数据添加、修改、删除时使用post
	* get支持最大字节限制2038Bytes， post支持最大字节限制2GB
	

### file()獲取到的結果

* 和file_get_content()類似,不過file返回數組.數組中的每個單元對應都是文件中的一行,包括換行符在內.

### Array 和 Hash的區別,在內存如何分配

* hash表在初始化的時候會創建一個內存區(實際上就是數組)來存放對象,這個數組的大小一般情況下會比hash表存放對象數量大很多.然後根據對象的Key的GetHashCode方法來獲取一個hash值,通過運算後得到內部數組的一個索引,然後將對象放於此,當容量達到最大容量的時候,hash表會擴充自己的容量.
* 由於hash表裏面的數據是比較稀疏的,所以hash表會佔用比較大的內存.但是由於索引是通過Key的hashcode運算出來 的,所以hash表的查找運算會很快.適用於經常進行查找的環境.
	
			var hash = {
				property1:{},
				property2:[],
				property3:3
			}
		
* Array實際上就是一個順序的動態數組,開始用一個默認的數值開一個數組,然後順序存放對象,當最大容量達到時再擴充數組的容量.
* Array是順序存放的,所以查找比hash慢很多.但是array不會浪費空間.而且也實現了動態化的添加和刪除,用起來比較方便.
	
			var arr = new Array();
			arr[0] = 0;
			arr[1] = 2;

### PHP的环境变量
### PHP的预定义变量

* $_GET
* $_POST
* $_COOKIE
* $_FILES
* $_REQUEST
* $_SESSION
* $_ENV
* $php_errormsg
* $argc 传递给脚本的参数数目
* $argv 传递给脚本的参数数组

### 引用

* 在 PHP 中引用意味着用不同的名字访问同一个变量内容
* 如果具有引用的数组被拷贝，其值不会解除引用。对于数组传值给函数也是如此。
* 如果对一个未定义的变量进行引用赋值、引用参数传递或引用返回，则会自动创建该变量。
	
		$b = array();
		foo($b['b']);
		var_dump(array_key_exists('b', $b)); // bool(true)

### 单例模式

* 保证一个类仅有一个实例，并提供一个访问它的全局访问点。
* 私有构造函数, 防止其他类实例化它，而且单例类也不应该被继承.
* 静态私有成员变量instance,保存单实例的引用.
* 静态公有方法Instance(), 负责检验并实例化自己，然后存储在静态成员变量中，以确保只有一个实例被创建.获取单实例的引用，如果实例为null即创建一个。

