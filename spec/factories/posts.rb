FactoryGirl.define do

  factory :post do |f|

    f.title { Faker::Name.title }

    f.description { Faker::Hipster.paragraphs }

  end

end
