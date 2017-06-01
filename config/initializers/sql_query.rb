SqlQuery.configure do |config|
  config.path = '/app/queries/views'
  config.adapter = ApplicationRecord
end