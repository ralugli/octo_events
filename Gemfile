# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'rswag-api', '~> 2.7'
gem 'rswag-ui', '~> 2.7'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
  gem 'rswag-specs', '~> 2.7'
  gem 'rubocop-performance', '~> 1.15', require: false
  gem 'rubocop-rails_config', '~> 1.11', '>= 1.11.3', require: false
  gem 'rubocop-rspec', '~> 2.13', '>= 2.13.2', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
end
