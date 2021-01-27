source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 4.0.0.beta2'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # factory_bot is a fixtures replacement with a straightforward definition syntax,
  # support for multiple build strategies (saved instances, unsaved instances, attribute hashes,
  # and stubbed objects), and support for multiple factories for the same class
  # (user, admin_user, and so on), including factory inheritance. https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '~> 4.0'
  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners to test common Rails functionality that,
  # if written by hand, would be much longer, more complex, and error-prone. https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 3.1'
  # A library for generating fake data such as names, addresses, and phone numbers. https://github.com/faker-ruby/faker
  gem 'faker'
  # Database Cleaner is a set of gems containing strategies for cleaning your database in Ruby.
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# A Ruby static code analyzer and formatter, based on the community Ruby style guide.
gem 'rubocop', '~>0.81'

# Flexible authentication solution for Rails with Warden.
gem 'devise'

# A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'jwt'
