FactoryGirl.define do
  factory :movie do
    title Faker::Book.title
    description Faker::Lorem.paragraphs.join(" ")
    released_on Faker::Date.backward(300)
    total_gross 50_000_000
    image_file_name "#{Faker::Book.title}.jpg"
    rating "PG-13"
  end
end
