# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-performance', '~> 1.15', require: false
  gem 'rubocop-rails_config', '~> 1.11', '>= 1.11.3', require: false
  gem 'rubocop-rspec', '~> 2.13', '>= 2.13.2', require: false
end
