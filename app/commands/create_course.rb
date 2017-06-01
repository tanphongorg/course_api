class CreateCourse < ApplicationCommand
  prepend SimpleCommand
  include ActiveModel::Model

  attr_reader :title, :current_client

  validates :title, presence: true, allow_blank: false
  validates :current_client, presence: true

  def initialize(options = {})
    @title = options.fetch(:title)
    @current_client = options.fetch(:current_client)
  rescue => e
    errors.add :create_course, e.message
  end

  def call
    current_client.courses.create! title: title if valid?
  rescue => e
    errors.add :create_course, e.message
  end
end
