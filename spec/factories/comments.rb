FactoryGirl.define do
  factory :comment do |f|
    f.description { Faker::Hipster.paragraphs }
  end
end
