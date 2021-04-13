# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "127.0.0.1", user: "vagrant", roles: %w{app db web}, my_property: :my_value
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}



# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.


# deploy.rb or stage file (staging.rb, production.rb or else)
set :rvm_type, :system                     # Defaults to: :auto
set :rvm_ruby_version, 'ruby-2.7.2'      # Defaults to: 'default'
# set :rvm_custom_path, '/usr/local/rvm'  # only needed if not detected
set :rvm_roles, [:app, :web]


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
set :ssh_options, {
  keys: %w(/home/raul/RubymineProjects/.vagrant/machines/default/virtualbox/private_key),
  forward_agent: true,
  port: 2222,
  auth_methods: %w(publickey password)
}
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }


#  yum install -y gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel ruby-devel gcc-c++ jq git
# curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
#
# # Install RVM
# curl -sSL https://get.rvm.io | bash -s stable
#  rvm install 2.7.2
# rvm use 2.7.2 --default
# gem install bundler -v 1.17.3
#
# sudo yum -y install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
# sudo service postgresql initdb
# # Use MD5 Authentication
# sudo sed -i.bak -e 's/ident$/md5/' -e 's/peer$/md5/' /var/lib/pgsql9/data/pg_hba.conf
# #start
# sudo /sbin/chkconfig --levels 235 postgresql on
# sudo service postgresql start
#
#  yum install -y libxml2 libxml2-devel libxslt libxslt-devel