set :application, "application"
set :deploy_to, "/var/www/#{application}"

set :repository, "git@github.com:rithis/#{application}.git"
set :scm, :git

set :shared_files, ["app/config/parameters.yml"]
set :shared_children, ["app/logs", "web/uploads", "vendor"]
set :asset_children, []

set :user, "www-data"
set :use_composer, true
set :update_vendors, false

set :symfony_env_prod, "dev"

set :domain, "symfony.rithis.com"
server domain, :app, :db, :primary => true
