FactoryBot.define do

  factory :post do
    title  {"abe"}
    text   {"abcdefg"}
    image  { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end
end