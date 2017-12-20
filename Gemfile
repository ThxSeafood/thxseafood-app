# frozen_string_literal: false

source 'https://rubygems.org'
ruby '2.4.2'

# Infrastructure related
gem 'http'

# Development/Debugging related
gem 'pry' # to run console in production
gem 'rake' # to run console in production

# Web related
gem 'econfig'
gem 'puma'
gem 'roda'
gem 'slim'

# Application related
gem 'dry-validation'
gem 'multi_json'
gem 'roar'

# Services
gem 'dry-monads'
gem 'dry-transaction'

group :test do
  gem 'minitest'
  gem 'minitest-rg'
  gem 'rack-test'

  gem 'headless'
  gem 'page-object'
  gem 'watir'
end

group :development, :test do
  gem 'rerun'

  gem 'flog'
  gem 'reek'
  gem 'rubocop'
end
