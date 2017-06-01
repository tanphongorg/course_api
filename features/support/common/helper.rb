require_relative './errors_helper'
require_relative './response_helper'
require_relative './auth_helper'
#require_relative './users_helper'

module Common  
  module Helper
    include Common::AuthHelper
    include Common::ErrorsHelper
    include Common::ResponseHelper    
    #include Common::UsersHelper

    def create_client
      create(:client)
    end

    def current_client
      @current_client
    end

    def json_body
      last_response.body
    end

    def parsed_body
      JSON.parse(json_body, symbolize_names: true)
    end

    def json_encode(json_hash)
      ActiveSupport::JSON.encode(json_hash)
    end

    def app
      Rack::Builder.parse_file('config.ru').first
    end

    def http_status
      last_response.status
    end

    def json_datetime_format(datetime)
      datetime.to_formatted_s(:iso8601) if datetime
    end

    def body_ids
      parsed_body.map { |obj| obj['id'] }
    end
  end
end