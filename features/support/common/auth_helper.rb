module Common
  module AuthHelper
    include Spinach::DSL

    step 'I\'m a client' do
      @client = create_client
    end

    step 'I authenticate' do
      post authenticate_clients_url, authenticate_client_params
      header 'Authorization', jwt_token
      @current_client = @client
    end

    private

    def authenticate_client_params
      {
        data: {
          name: @client.name,
          password: @client.password
        }
      }
    end    

    def jwt_token
      parsed_body.fetch(:data)
    rescue => e
      nil
    end
  end
end
