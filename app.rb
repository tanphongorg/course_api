ENV['RACK_ENV'] ||= 'development'
ENV['KARAFKA_ENV'] ||= ENV['RACK_ENV']

Bundler.require(:default, ENV['KARAFKA_ENV'])

require_relative 'config/environment'
class ApplicationWorker < Karafka::BaseWorker
  # You can disable WorkerGlass components if you want to
  prepend WorkerGlass::Timeout
  prepend WorkerGlass::Reentrancy

  # If you remove WorkerGlass::Timeout, this line will be useless as well
  self.timeout = 60
end

# App class
class App < Karafka::App
  setup do |config|
    config.kafka.hosts = %w( kafka:9092 )
    config.name = 'example_app'
    config.redis = {
      url: 'redis://redis:6379'
    }
    config.inline_mode = false
    config.batch_mode = false
  end
end


App.routes.draw do
  topic :test_created do
    controller TestController
  #   interchanger CustomInterchanger
  end
end

App.boot!
