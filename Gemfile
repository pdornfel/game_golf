source "https://rubygems.org"

ruby "2.1.2"

# Thoughtbot
gem "airbrake"
gem "bourbon", "~> 3.2.1"
gem "coffee-rails"
gem "delayed_job_active_record"
gem "email_validator"
gem "flutie"
gem "high_voltage"
gem "i18n-tasks"
gem "jquery-rails"
gem "neat", "~> 1.5.1"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "rack-timeout"
gem "rails", "4.1.4"
gem "recipient_interceptor"
gem "sass-rails", "~> 4.0.3"
gem "simple_form"
gem "title"
gem "uglifier"
gem "unicorn"

gem 'foundation-rails'


# My Stuff
# gem 'sportsdata'
gem 'sportsdata', :git => 'https://github.com/pdornfel/sportsdata'
# gem 'sportsdata', path: '/Users/pauldornfeld/Dropbox/Code/Gems/sportsdata'

gem 'sorcery'

gem "factory_girl_rails"

group :development do
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "awesome_print"
  gem "byebug"
  gem "dotenv-rails"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.0.0"
  gem 'quiet_assets'
end

group :test do
  gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "newrelic_rpm", ">= 3.7.3"
end
