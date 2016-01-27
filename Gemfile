source 'https://rubygems.org'
ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.5'

gem 'wash_out', git: 'git://github.com/inossidabile/wash_out.git'
# Gems used only for assets and not required in production environments by
# default.
 gem 'washout_builder'
#gem 'washout_builder', path: '/home/raul/workspace/github/washout_builder'
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use Unicorn as the app server
gem 'puma'
gem 'rake', '~> 10.5'


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
  gem 'rspec-rails', '~> 3.4'
  gem 'simplecov', '~> 0.10'
  gem 'simplecov-summary', '~> 0.0.4'
  gem 'mocha', '~> 1.1'
  gem 'coveralls', '~> 0.7'
end
