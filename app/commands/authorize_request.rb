class AuthorizeRequest < ApplicationCommand
  prepend SimpleCommand

  def initialize(options = {})
    @headers = options.fetch(:headers)
    @json_web_token = options.fetch(:json_web_token, JsonWebToken)
    @client_repo = options.fetch(:client_repo, Client)
  rescue => e
    errors.add :authorize_request, e.message
  end

  def call
    decoded_auth_token ||= json_web_token.decode(http_auth_header)
    client = decoded_auth_token ? client_repo.find(decoded_auth_token.fetch(:client_id)) : nil
    client || errors.add(:token, I18n.t(:invalid_token)) && nil
  rescue => e
    errors.add :authorize_request, e.message
  end

  private

  attr_reader :headers, :json_web_token, :client_repo

  def http_auth_header
    ret = nil
    if headers['Authorization'].present?
      ret = headers['Authorization'].split(' ').last
    else
      errors.add(:token, I18n.t(:missing_token))
    end
  end
end
