FactoryGirl.define do
  factory :user do
    name                  Faker::Name.first_name
    email                 Faker::Internet.email
    # password              pass
    # password_confirmation pass
    password              Faker::Internet.password(8)
  end
end
