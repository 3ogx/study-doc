# ruby study

## 使用 ri 碰到的問題
	ri -a
	/Library/Ruby/Gems/1.8/gems/rdoc-4.0.1/lib/rdoc/ri/paths.rb:88:in `gemdirs': undefined method `map' for Gem::Specification:Class (NoMethodError)
	from /Library/Ruby/Gems/1.8/gems/rdoc-4.0.1/lib/rdoc/ri/paths.rb:58:in `each'
	from /Library/Ruby/Gems/1.8/gems/rdoc-4.0.1/lib/rdoc/ri/driver.rb:378:in `initialize'
	from /Library/Ruby/Gems/1.8/gems/rdoc-4.0.1/lib/rdoc/ri/driver.rb:355:in `new'
	from /Library/Ruby/Gems/1.8/gems/rdoc-4.0.1/lib/rdoc/ri/driver.rb:355:in `run'
	from /Library/Ruby/Gems/1.8/gems/rdoc-4.0.1/bin/ri:12
	from /usr/bin/ri:19:in `load'
	from /usr/bin/ri:19
### 解決方法
	create file ~/.gemrc
	gem: --no-rdoc --no-ri
	install: --no-rdoc --no-ri
	update:  --no-rdoc --no-ri
	
	# 最重要的是下面這句
	sudo gem update --system
