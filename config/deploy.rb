require "rvm/capistrano"
require "bundler/capistrano"

set :deploy_to, "/home/app/myapp"
set :repository,  "git://github.com/merryead/kk-furniture.git"
set :rvm_ruby_string, "1.9.3-p429@myapp"
set :use_sudo, false
set :deploy_via, :remote_cache
set :bundle_without, [:development, :test]
set :shared_children, shared_children + %w{public/uploads}

set :user, "app"
role :web, "162.243.64.236"
role :app, "162.243.64.236"
role :db,  "162.243.64.236", :primary => true

after "deploy:restart", "deploy:cleanup"
after "deploy", "rvm:trust_rvmrc"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end