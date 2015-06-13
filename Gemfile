source "https://rubygems.org"

ruby "2.1.3"

gem "rails", "4.2.0"

gem "pg"
gem "pg_search"

gem "geocoder", "~> 1.2.8"

gem "jquery-rails"
gem "uglifier", ">= 1.3.0"

gem "sass-rails", "~> 5.0.0"
gem "bourbon", "~> 4.2.2"
gem "neat", "~> 1.7.2"

gem "subdivision_select"

gem "activeadmin", "~> 1.0.0.pre1"
gem "devise" # for ActiveAdmin only

gem "email_validator", "~> 1.6.0"

gem "mail_form", "~> 1.5.1"

group :production do
  gem "rails_12factor"
end

group :development, :test do
  gem "byebug"
  gem "spring"
  gem "web-console", "~> 2.0"
  gem "letter_opener"
  gem "faker"
end

group :test do
  gem "capybara", "~> 2.4.4"
  gem "factory_girl_rails", "~> 4.5.0"
  gem "rspec-rails", "~> 3.2.1"
  gem "rubocop", "~> 0.30.1"
  gem "scss_lint", "~> 0.39.0", require: false
end
