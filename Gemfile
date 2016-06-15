source 'https://rubygems.org'
ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0.rc1'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

gem 'client',  path: 'engines/client'
gem 'namespace-engine2',  path: 'engines/engine2'

gem 'wash_out', git: 'git://github.com/inossidabile/wash_out.git'
#gem 'wash_out', path: "/home/raul/workspace/github/wash_out"
# Gems used only for assets and not required in production environments wwby
# default.
# gem 'washout_builder'
gem 'washout_builder', path: '/home/raul/workspace/github/washout_builder'
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'puma'
gem 'rake', '~> 11.0'


group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  # Use sqlite3 as the database for Active Record
  # codesmell and speed tests
  gem 'rack-mini-profiler'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # codesmell and speed tests
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


group :test do
#  gem 'rspec-rails'
  gem 'simplecov', '~> 0.10'
  gem 'simplecov-summary', '~> 0.0.4'
  gem 'mocha', '~> 1.1'
  gem 'coveralls', '~> 0.7'
end
