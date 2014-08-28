set :application, 'bdo'
set :repo_url, 'git@github.com:cinic/crm.git'


ask :branch, "dev"
set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/upload public/assets}

set :default_env, { rvm_bin_path: '~/.rvm/bin' }
set :keep_releases, 3
set :use_sudo, false
set :precompile_only_if_changed, true

Rake::Task["deploy:compile_assets"].clear

namespace :foreman do
  desc "Export the Procfile to Ubuntu's upstart scripts"
  task :export do
    on roles :app do
      execute "cd #{current_path} && (RAILS_ENV=#{fetch(:stage)} ~/.rvm/bin/rvm default do rvmsudo bundle exec foreman export upstart /etc/init -a #{fetch(:app_name)} -u #{fetch(:user)} -l #{shared_path}/log/#{fetch(:app_name)})"
    end
  end

  desc "Start the application services"
  task :start do
    on roles :app do
      execute "sudo service #{fetch(:app_name)} start"
    end
  end

  desc "Stop the application services"
  task :stop do
    on roles :app do
      execute "sudo service #{fetch(:app_name)} stop"
    end
  end

  desc "Restart the application services"
  task :restart do 
    on roles :app do
      execute "sudo service #{fetch(:app_name)} start || sudo service #{fetch(:app_name)} restart"
    end
  end

end

namespace :deploy do
      # on OS X the equivalent pid-finding command is `ps | grep '/puma' | head -n 1 | awk {'print $1'}`
      #run "(kill -s SIGUSR1 $(ps -C ruby -F | grep '/puma' | awk {'print $2'})) || #{sudo} service #{fetch(:app_name)} restart"
 
  desc "Precompile assets locally and then rsync to web servers" 
  task :compile_assets do 
    on roles(:web) do 
      rsync_host = host.to_s 
 
      run_locally do 
        with rails_env: fetch(:stage) do ## Set your env accordingly.
          execute :bundle, "exec rake assets:precompile"
        end 
        execute "rsync -av --delete -e 'ssh -p 2605' ./public/assets/ #{fetch(:user)}@#{rsync_host}:#{shared_path}/public/assets/" 
        execute "rm -rf public/assets" 
        # execute "rm -rf tmp/cache/assets" # in case you are not seeing changes 
      end 
    end 
  end
  
  after :finishing, "deploy:cleanup"
  after :finishing, "foreman:export"
  after :finishing, "foreman:restart"
end

