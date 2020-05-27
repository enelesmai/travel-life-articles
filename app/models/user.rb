class User < ApplicationRecord
  has_many :travels, foreign_key: :author_id, primary_key: :id
  has_many :votes
  has_many :voteds, through: :votes, source: :travels
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end
