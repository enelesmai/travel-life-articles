class User < ApplicationRecord
    has_many :travels
    has_many :votes
    has_many :voteds, through: :votes, source: :travels
end
