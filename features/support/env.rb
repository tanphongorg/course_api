ENV['RAILS_ENV'] = 'test'
require 'simplecov'
  SimpleCov.start :rails do
end
require './config/environment'
Dir[Rails.root.join('features/support/common/**/*.rb')].each { |f| require f }

require 'rspec'
require 'rack/test'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
#
Spinach.hooks.before_scenario{ DatabaseCleaner.clean }
#
# Spinach.config.save_and_open_page_on_failure = true

class Spinach::FeatureSteps
  include Rack::Test::Methods
  include FactoryGirl::Syntax::Methods
  include Rails.application.routes.url_helpers
  include RSpec::Matchers
  include Common::Helper
end

Rails.application.routes.default_url_options[:host] = 'api.course.com'

ActiveRecord::Migration.maintain_test_schema!