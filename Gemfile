source 'https://rubygems.org'

ruby '2.2.1'
gem 'rails', '4.2.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
  gem 'bcrypt-ruby', '~> 3.1.2'
# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  #gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov'
end
group :test do
	gem 'faker'
	gem 'capybara'
#	gem 'gurad-rspec'
#	gem 'launchy'
end



group :production do
  gem 'pg'
  
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
gem 'haml'

gem 'turbolinks'
