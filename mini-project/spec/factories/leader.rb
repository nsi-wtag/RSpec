FactoryBot.define do
  factory :leader do
    first_name { 'John' }
    last_name { 'Adams' }
    email { 'johnadams@gmail.com' }
    phone_number { '336-777-7025' }
  end
end
