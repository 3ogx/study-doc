#### OA2 使用 `yii migrate` 数据迁移

在console.php中配置如下：

	'commandMap' => array(
		'migrate' => array(
			'class' => 'system.cli.commands.MigrateCommand',
			'migrationPath' => 'application.migrations',
			'migrationTable' => 'mirgate',
			'connectionID' => 'db',
			'templateFile' => 'application.migrations.template'
		)
	),


命令行使用：
	
	yiic migrate create nt_1405

编辑 `protected/migrations/m20120502_nt_1405.php` 

	$this->createTable(
		'core_safe_set', array(
			'safe_type' => 'varchar(25) not null',
			'content' => 'text',
			'primery key (`safe_type`)'	
		),
	);

## YII框架熟悉
###### 开启YII数据库调式信息
###### YII文本连接
当使用zii.widgets.CMenu生成导航的地址是一个URL时，用字符串替换数组就行。

	$this->widgets('zii.widgets.CMenu',
		array(
			'id' => 'dom_id',
			'html_options' => array('class' => 'class_name'),
			'activeCssClass' => 'selected_css',
			'item' => array(
				array('label' => '首页', 'url' => array('/module/action'), 'active' => 'bool'),
				array('label' => 'soft+', 'url' => 'http://URL', 'active' => 'bool'),
			),
		)
	)

> 注意 **'url'=> 'http://URL'**

###### 数据访问对象（DAO）
+ 连接数据库 CDbConnection
	* DSN / PDO
		- mysql:host=localhost;port=3306;dbname=dbname;
	* YII 应用组件
		- 配置DB应用组件
+ SQL语句   CDbCommand
+ 获取查询记录 CDbDataReader
	* while (CDbDataReader->read()) {}
	* foreach (CDbDataReader AS val) {}
+ 事务 CDbTransaction


#### OA2 使用 `yii migrate` 数据迁移

在console.php中配置如下：

	'commandMap' => array(
		'migrate' => array(
			'class' => 'system.command.migrationCommand',
			'migrationPath' => 'application.migrations',
			'migrationTable' => 'mirgate',
			'connectionID' => 'DB',
			'templateFile' => 'application.migrations.template'
		)
	),
