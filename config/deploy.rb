# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, "router_admin"
set :repo_url, "git@github.com:bweave/weekly_meals.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/pi/#{fetch :application}"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", ".bundle", "public/system", "public/uploads"

# Only keep the last 3 releases to save disk space
set :keep_releases, 3

# Optionally, you can symlink your database.yml and/or secrets.yml file from the shared directory during deploy
# This is useful if you don"t want to use ENV variables
# append :linked_files, "config/database.yml", "config/secrets.yml"

namespace :deploy do
  # desc "Reload Sidekiq"
  # task :reload_sidekiq do
    # on roles(:app) do
      # execute "sudo service sidekiq reload"
    # end
  # end
end

# after "deploy:publishing", "deploy:reload_sidekiq"
