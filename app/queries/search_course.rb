class SearchCourse < ApplicationQuery
  def initialize(options = {})
    @q = options[:q].to_s
    @current_client = options[:current_client]
    @query = SqlQuery.new(:search_course, q: q, current_client: current_client)
  end

  private

  attr_reader :q, :current_client
end
