class User < ApplicationRecord
    has_many :travels, foreign_key: :author_id, primary_key: :user_id
    has_many :votes
    has_many :voteds, through: :votes, source: :travels
end
