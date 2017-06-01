FactoryGirl.define do
  factory :course do
    sequence(:title) { |n| "course_#{n}" }
  end
end
