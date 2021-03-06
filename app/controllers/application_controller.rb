class ApplicationController < ActionController::API
  before_action :require_client

  private

  attr_reader :current_command, :current_query, :current_client

  def with_client(params)
    params.merge(current_client: current_client)
  end

  def with_producer(params)
    params.merge(producer: producer)
  end

  def require_client
    @current_client = AuthorizeRequest.call(authorize_request_params).result
    render(json: { errors: I18n.t(:client_not_authorized) }, status: 401) unless current_client
  end

  def render_json(success_status = 200, failed_status = 422)
    if current_command
      if current_command.success?
        render json: current_command, status: success_status
      else
        render json: current_command, status: failed_status
      end
    elsif current_query
      render json: { data: current_query }, status: success_status
    else
      head 204
    end
  end

  def producer
    $kafka_producer
  end

  def authorize_request_params
    {
      headers: request.headers,
      json_web_token: JsonWebToken,
      client_repo: Client
    }
  end
end
