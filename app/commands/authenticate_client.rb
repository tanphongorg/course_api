class AuthenticateClient < ApplicationCommand
  prepend SimpleCommand
  include ActiveModel::Model

  attr_reader :name, :password

  validates :name, presence: true, allow_blank: false
  validates :password, presence: true, allow_blank: false

  def initialize(options = {})
    @name = options.fetch(:name)
    @password = options.fetch(:password)
    @json_web_token = options.fetch(:json_web_token, JsonWebToken)
    @client_repo = options.fetch(:client_repo, Client)
  rescue => e
    errors.add :authenticate_client, e.message
  end

  def call
    JsonWebToken.encode(client_id: client.id) if client
  rescue => e
    errors.add :authenticate_client, e.message
  end

  private

  def client
    client = Client.find_by(name: name)
    return client if client && client.authenticate(password)
    errors.add :authenticate_client, I18n.t(:invalid_credentials)
    nil
  end
end
