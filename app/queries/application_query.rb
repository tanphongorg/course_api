class ApplicationQuery

  def execute
    query.execute
  end

  def sql
    query.sql
  end

  def explain
    query.explain
  end

  private

  attr_reader :query
end
