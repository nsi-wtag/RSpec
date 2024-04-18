FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.word }
    slug 'dummy-post-slug'
    association :post, factory: :post
  end
end
