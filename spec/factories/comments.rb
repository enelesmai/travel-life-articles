FactoryBot.define do
  factory :comment do
    author_name { 'Nologged' }
    body { 'This is a comment' }
  end
end
