class Category < ApplicationRecord
  has_many :travel_categories
  has_many :travels, through: :travel_categories
  validates :name, presence: true, length: { minimum: 1 }, uniqueness: true
  validates :priority, presence: true, uniqueness: true

  def latest_traveling_article
    travels.max_by(&:created_at)
  end
end
