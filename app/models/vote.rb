class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  validates :user_id, uniqueness: { scope: :travel_id }
end
