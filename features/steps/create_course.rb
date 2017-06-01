class Spinach::Features::CreateCourse < Spinach::FeatureSteps
  step 'I request to create a course' do
    create_course course_params
  end

  step 'a new course is created for the client' do
    expect(last_course.title).to eql(expected_title)
  end

  step 'I request to create a course with empty title' do
    create_course course_params_with_empty_title
  end

  step 'no new course is created for the client' do
    expect(total_course).to eql(0)
  end

  private

  def create_course(params)
    post courses_url, params
  end

  def course_params
    {
      data: {
        title: expected_title
      }
    }
  end

  def course_params_with_empty_title
    {
      data: {
        title: ''
      }
    }
  end

  def total_course
    current_client.try(:courses).try(:count).to_i
  end

  def expected_title
    @expected_title ||= Faker::Lorem.sentence
  end

  def last_course
    @last_course ||= current_client.courses.last
  end
end
