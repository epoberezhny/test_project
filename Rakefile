# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

if defined?(RSpec) && defined?(Rswag::Specs)
  RSpec.configure do |config|
    config.swagger_dry_run = false
  end
end

Rails.application.load_tasks
