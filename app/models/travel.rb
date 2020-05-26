class Travel < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :votes
  has_many :voters, through: :votes, source: :user
  has_many :travel_categories
  has_many :categories, through: :travel_categories
  has_many :comments
  has_one_attached :image
  validates :title, presence: true, length: { minimum: 10 }
  validates :text, presence: true, length: { minimum: 100 }
  validates :image, attached: true
  before_save :ensure_travel_belongs_to_one_category

  def ensure_travel_belongs_to_one_category
    if category_ids.count.zero?
      errors.add(:base, 'An article must belongs to one category at least')
      throw(:abort)
    else
      true
    end
  end

  def total_votes
    votes.length
  end

  def default_image
    'https://www.samsung.com/etc/designs/smg/global/imgs/support/cont/NO_IMG_600x600.png'
  end

  def self.featured_traveling_article
    Travel.all.includes(:votes).includes([:image_attachment]).max_by { |t| t.votes.length }
  end

end
