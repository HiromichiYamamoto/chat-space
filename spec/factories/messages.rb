FactoryGirl.define do
  factory :message do
    id          Faker::Number.unique.number(1)
    body        Faker::Lorem.characters
    image       File.open(File.join(Rails.root, 'spec/fixtures/image.jpg'))
    user
    group
  end
end
