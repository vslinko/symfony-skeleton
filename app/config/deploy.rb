set :application, "application"
set :deploy_to, "/var/www/#{application}"

set :repository, "git@github.com:rithis/#{application}.git"
set :scm, :git

set :shared_files, ["app/config/parameters.yml"]
set :asset_children, []

set :user, "www-data"
set :use_sudo, false
set :use_composer, true
set :update_vendors, false
set :clear_controllers, false

set :symfony_env_prod, "dev"

set :domain, "symfony.rithis.com"
server domain, :app, :db, :primary => true

before 'symfony:composer:install', 'composer:copy_vendors'
before 'symfony:composer:update', 'composer:copy_vendors'

namespace :composer do
  task :copy_vendors, :except => { :no_release => true } do
    pretty_print "--> Copy vendor file from previous release"

    run "vendorDir=#{current_path}/vendor; if [ -d $vendorDir ] || [ -h $vendorDir ]; then cp -a $vendorDir #{latest_release}/vendor; fi;"
    puts_ok
  end
end
