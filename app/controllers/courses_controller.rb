class CoursesController < ApplicationController
  def create
    create_course(create_course_params)
    render_json(:created)
  end

  def index
    search_course(search_courses_params)
    render_json
  end

  private

  def create_course(params)
    @current_command ||= CreateCourse.call(params)
  end

  def create_course_params
    params.require(:data).permit(:title)
  end

  def search_course(params)
    @current_query ||= SearchCourse.new(params).execute
  end

  def search_courses_params
    params.permit(:q)
  end
end
