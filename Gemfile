source 'https://rubygems.org'
ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.1.3'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'therubyracer', :require => 'v8', platforms: :ruby
gem 'execjs'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

gem 'my_engine',  path: 'engines/my_engine'
gem 'namespace-my_engine2',  path: 'engines/my_engine2'
gem 'my_engine3',  path: 'engines/my_engine3'

gem 'wash_out', git: 'https://github.com/inossidabile/wash_out.git'
#gem 'wash_out', path: "/home/raul/RubymineProjects/wash_out"
# Gems used only for assets and not required in production environments wwby
# default.
 gem 'washout_builder', git: 'https://github.com/bogdanRada/washout_builder.git'
 gem 'enhanced_date_select'
#  gem 'washout_builder', path: '/home/raul/RubymineProjects/washout_builder'
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use ActiveModel has_secure_password

# gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
gem 'puma'
gem 'rake', '>= 11.0'
gem 'savon'
#TODO: upgrade wasabi when savon will be compatible with >= 3.6.0
gem 'wasabi', '3.5.0'
gem 'httpi'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'

  # Use sqlite3 as the database for Active Record
  # codesmell and speed tests
  gem 'rack-mini-profiler'
  gem 'memory_profiler'
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
  gem 'mocha'
  gem 'coveralls', '>= 0.8'


  gem 'simplecov', :require => false
  gem 'simplecov-summary', :require => false

  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support rspec-instafail].each do |lib|
    gem lib
  end

  gem 'shoulda-matchers', '~> 3.1'

  gem 'forgery'
  gem 'factory_girl_rails'
  gem 'webmock'

end
