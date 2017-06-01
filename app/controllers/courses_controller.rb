class CoursesController < ApplicationController
  def create
    create_course(create_course_params)
    render_json(:created)
  end

  private

  def create_course(params)
    @current_command ||= CreateCourse.call(params)
  end

  def create_course_params
    params.require(:data).permit(:title)
  end
end
