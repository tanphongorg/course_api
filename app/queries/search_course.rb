class SearchCourse < ApplicationQuery
  def initialize(options = {})
    @q = options[:q].to_s
    @query = SqlQuery.new(:search_course, q: q)
  end

  private

  attr_reader :q
end
