class CreateCourse < ApplicationCommand
  prepend SimpleCommand
  include ActiveModel::Model

  attr_reader :title

  validates :title, presence: true, allow_blank: false

  def initialize(options = {})
    @title = options[:title]
  end

  def call
    Course.create! title: title if valid?
  rescue => e
    errors.add :create_course, e.message
  end
end
