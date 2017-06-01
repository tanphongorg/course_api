class CreateCourse < ApplicationCommand
  prepend SimpleCommand
  include ActiveModel::Model

  attr_reader :title, :current_client, :producer

  validates :title, presence: true, allow_blank: false
  validates :current_client, presence: true
  validates :producer, presence: true

  def initialize(options = {})
    @title = options.fetch(:title)
    @current_client = options.fetch(:current_client)
    @producer = options.fetch(:producer)
  rescue => e
    errors.add :create_course, e.message
  end

  def call
    return nil unless valid?
    course = current_client.courses.create! title: title 
    producer.produce(course.to_json, topic: "course_created")
    course
  rescue => e
    errors.add :create_course, e.message
  end
end
