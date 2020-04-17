FactoryBot.define do

  factory :post do
    title              {"abe"}
    text               {"abcdefg"}
    image              { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.jpg')) }
  end
end