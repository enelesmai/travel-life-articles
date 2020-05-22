class TravelCategory < ApplicationRecord
    belongs_to :travel
    belongs_to :category
    validates :category_id, uniqueness: { scope: :travel_id }
end
