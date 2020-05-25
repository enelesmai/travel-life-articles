FactoryBot.define do
    factory :travel do
      author_id { 1 }
      title { "My first travel" }
      text { "this is the text for my first travel the description will be added later, we are going to describe everything here" }
    end
    factory :travel_category do
        travel_id { 1 }
        category_id { 1 }
      end
  end
  