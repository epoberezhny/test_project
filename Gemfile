source 'https://rubygems.org'

ruby '2.6.5'

# rails stack
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

# api docs
gem 'rswag-api'
gem 'rswag-ui'

# styling
gem 'bootstrap', '~> 4.4.1'

# assets
gem 'sass-rails', '>= 6'
# gem 'webpacker', '~> 4.0'

# templates
gem 'hamlit-rails'

# pagination
gem 'pagy'

# business logic
gem 'reform-rails', '~> 0.2.0.rc3'
gem 'trailblazer-rails'
gem 'validates_timeliness'

# JSON serialization
gem 'oj'

# working with spatial data
gem 'rgeo', github: 'rgeo'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'rswag-specs'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'site_prism'
  gem 'site_prism-table'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
