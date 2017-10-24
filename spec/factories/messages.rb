FactoryGirl.define do
  factory :message do
    id          "1"
    body        "こんにちわ"
    image       File.open(File.join(Rails.root, 'spec/fixtures/image.jpg'))
    user
    group
  end
end
