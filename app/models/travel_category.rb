class TravelCategory < ApplicationRecord
    belongs_to :travel
    belongs_to :category
end
