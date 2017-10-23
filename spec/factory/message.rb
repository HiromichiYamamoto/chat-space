FactoryGirl.define do

  factory :message do
    id          '1'
    body        'こんにちわ'
    image       Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image/jpg'))
    created_at  '2017-10-21T00:00:00Z'
    updated_at  '2016-01-21T00:00:00Z'
  end

end
