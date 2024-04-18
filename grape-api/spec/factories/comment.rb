FactoryBot.define do
  factory :comment do
    author { Faker::Name.name }
    content { Faker::Lorem.paragraph }
    association :post, factory: :post
  end
end
