FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    slug { 'demo-post-slug' }
    content { Faker::Lorem.paragraphs(number: 3).join('\n') }
  end
end
