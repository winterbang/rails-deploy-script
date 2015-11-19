# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'my_app_name'
set :repo_url, 'git@example.com:me/my_repo.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

task :execute_on_server do
  on "root@example.com" do
    execute "some_command"
  end
end

role :winter, "verybang@123.57.167.99"

task :test do
  on roles(:winter) do
    execute "cd ~;mkdir deploy_test"
  end
end

task :nginx do 
  on roles(:winter) do
  	# Install Web server
		p "=== Install Web Server"
		execute 'wget http://sysoev.ru/nginx/nginx-0.7.64.tar.gz'
		execute 'tar zxf nginx-0.7.64.tar.gz'
		p ""
		p "===*** Nginx install Warring! ***==="
		p "   *** nginx source path: /tmp/nginx-0.7.64 "
		p "   *** must be install nginx in: /etc/nginx "
		p ""
		execute 'sudo passenger-install-nginx-module'
		p "=== Web Server install done."
		p ""
  end
end 


