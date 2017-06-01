class ClientsController < ApplicationController
  skip_before_action :require_client

  def authenticate
    authenticate_client(authenticate_client_params)
    render_json(200)
  end

  private

  def authenticate_client(params)
    @current_command ||= AuthenticateClient.call(params)
  end

  def authenticate_client_params
    params.require(:data).permit(:name, :password)      
  end
end
