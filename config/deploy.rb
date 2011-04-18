# START:require_and_application
require 'bundler/capistrano'
set :application, "massiveapp"
# END:require_and_application
# START:scm
set :scm, :git
set :repository, "git://github.com/deployingrails/massiveapp.git"
# END:scm
# START:host
server "localhost", :app, :db, :primary => true
# END:host
# START:ssh
ssh_options[:port] = 2222
ssh_options[:keys] = "/Library/Ruby/Gems/1.8/gems/vagrant-0.7.2/keys/vagrant"
# END:ssh
# START:user
set :user, "vagrant"
set :group, "vagrant"
set :deploy_to, "/home/vagrant/massiveapp"
set :use_sudo, false
# END:user
# START:copy_strategy
set :deploy_via, :copy
set :copy_strategy, :export
# END:copy_strategy
# START:passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  desc "Restart the application"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
# END:passenger

after "deploy:symlink", "deploy:copy_in_database_yml"

role :util, "localhost"