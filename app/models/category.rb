class Category < ApplicationRecord
    has_many :travel_categories
    has_many :travels, through: :travel_categories
end
