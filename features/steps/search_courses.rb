class Spinach::Features::SearchCourses < Spinach::FeatureSteps
  step 'I search for course' do
    get courses_url, search_courses_params
  end

  step 'There are already some courses created' do
    create_list(:course, 10)
  end

  step 'I get correct courses result' do
    expect(parsed_body.fetch(:data).length).to eql(1)
    expect(parsed_body.fetch(:data)[0].fetch(:title)).to eql('course_3')
  end

  step 'I search for course without query' do
    get courses_url
  end

  step 'I get all courses result' do
    expect(parsed_body.fetch(:data).length).to eql(10)
  end

  private

  def search_courses_params
    { q: 'course_3' }
  end
end
