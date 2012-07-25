set :application, "romaniansatgu"
set :domain,      "romaniansatgu.ro"
set :repository,  "git://github.com/sdorunga1/romaniansatgu.git"
set :use_sudo,    false
set :deploy_to,   "/home/ubuntu/webapps/romaniansatgu"
set :scm,         "git"
set :branch, 	  "master"
set :ssh_options, {:forward_agent => true}
set :user, "ubuntu"
ssh_options[:keys] = ["C:/Users/Stefan/Keys/first.pem"] 

load 'deploy/assets' #runs asssests precompile after deployment

role :app, "romaniansatgu.ro"
role :web, "romaniansatgu.ro"
role :db,  "romaniansatgu.ro", :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end

#set :application, "set your application name here"
#set :repository,  "set your repository location here"
#
#set :scm, :subversion
## Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#
#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end