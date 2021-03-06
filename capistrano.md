## capistrano deploy

#### installing
	;; ubuntu
	sudo apt-get install capistrano
	;; mac
	gem install capistrano
	
#### gen ssh key
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

#### deploy
	;; your project 
	cd /var/www/project
	capify .
	;; this will create Two file
	;; Capfile config/deploy.rb

#### deploy.rb
	;; your application name or hostname
	set :application, "xx.com"
	set :repository, "git@xx.com:project.git"
	;; 只保留5个版本
	set :keep_releases, 5
	;; deploy_to means deploy path, local path, domain
	set :deploy_to, "deploy path"

	;; scm source control manage, svn, cvs, bzr, accurev and so on
	set :scm, :git
	;; enable git submodule
	set :git_enable_submodules, 1
	set :scm_username, "xx"
	
	;; use_sudo means sudo command
	set :use_sudo, true
	;; user, you system user, not scm user
	set :user, "system user"
	set :password, ""
	set :sudo_prompt, "password"

	role :web, "#{application}"
	role :app, "#{application}"
	;; always wrong
	role :db, ""
	
	ssh_options[:keys] = %w{/home/user/.ssh/authorized_keys}
	ssh_options[:port] = 22
	default_run_options[:pty] = true

	;; task or deploy plugin
	task :show_files do
		run "ls -al #{current_path}"
	end

	cap -e show_files
	;; you can use above command call task
	
	;; deploy mod_rails module
	namespace :deploy do
		task :show_files do
			run "ls -al #{current_path}"
		end
	
		task :init do
			sudo "rm -rf #{current_path}/path1/cache/cacheFiles"
			run "chmod 777 -R #{current_path}/path1/cache"
		end

		;; clone submodules
		task :up do
			set :reso_path, "/var/www/"
			for i in ['a','b'] do
				if FileTest.directory?(current_path) then
					run "#{try_sudo} rm -rf #{current_path}"
				end

				run "cd #{reso_path}/git/ && git co dev"
				run "git clone #{reso_path}/git/name #{current_path}/git/name"
				run "cd #{current_path}/git/name && git co -b deploy"
			end
		end
	end
	cap deploy:init
	cap deploy:show_files
	;; you can use above command call task
	
	affter "deploy:update_code", "deploy:init"

#### Q&A
* no tty present and no askpass program specified
	default_run_options[:pty] = true

#### summary
[capistrano blog](http://cheat.errtheblog.com/s/capistrano/)
[ruby on rails](http://ihower.tw/rails3/deployment.html)
[capistrano note](http://blog.csdn.net/largetalk/article/details/6743090)