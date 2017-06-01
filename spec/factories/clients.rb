FactoryGirl.define do
  factory :client do
    name "LearnPub"
    domain "www.learnpub.net"
    password "123secret"
    password_confirmation "123secret"
  end
end
