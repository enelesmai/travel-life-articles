class Travel < ApplicationRecord
    belongs_to :user
    has_many :votes
    has_many :voters, through: :votes, source: :user
    has_many :travel_categories
    has_many :categories, through: :travel_categories
end
