FactoryBot.define do

  factory :post do
    title  {"abe"}
    text   {"abcdefg"}
    image  { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end