class Travel < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    has_many :votes
    has_many :voters, through: :votes, source: :user
    has_many :travel_categories
    has_many :categories, through: :travel_categories
    has_many :comments
    has_one_attached :image

    def total_votes
        votes.length
    end
end
