FactoryBot.define do
  factory :user do
    name { 'test' + Faker::Alphanumeric.alphanumeric(number: 2) }
  end
end
