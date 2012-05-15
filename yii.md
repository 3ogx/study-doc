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