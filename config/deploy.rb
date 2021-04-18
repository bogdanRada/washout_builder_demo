# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "washout_builder_demo"
set :repo_url, "git@github.com:bogdanRada/washout_builder_demo.git"

# Default branch is :master
ask :branch, fetch(:branch,  `git rev-parse --abbrev-ref HEAD`.chomp)

set :git_shallow_clone, 1
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/washout_builder_demo"

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
set :default_env, { path: "/usr/local/rvm/gems/ruby-3.0.0/bin:/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
set :local_user, -> { `git config user.name`.chomp }
set :use_sudo, true
# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
set :ssh_options, verify_host_key: :secure

set :bundle_config, { 'build.nokogiri' => '--use-system-libraries' }

set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, 'ruby-3.0.0'      # Defaults to: 'default'
# set :rvm_custom_path, '/usr/local/rvm'  # only needed if not detected
set :rvm_roles, [:app, :web]

set :ssh_options, {
  keys: %w(/home/raul/RubymineProjects/.vagrant/machines/default/virtualbox/private_key),
  forward_agent: true,
  port: 2200,
  auth_methods: %w(publickey password)
}

# file: lib/capistrano/tasks/rvmrc.rake
namespace :rvmrc do
  desc "Trust rvmrc file"
  task :trust do
    on roles(:all) do
      command = "rvmrc trust #{release_path}/#{fetch(:current_revision)}"
      execute :rvm, command
    end
  end
end

before 'deploy:set_current_revision', 'rvmrc:trust'
