class Comment < ApplicationRecord
  belongs_to :travel
  validates :author_name, presence: true, length: { minimum: 6 }
  validates :body, presence: true, length: { minimum: 10 }
end
