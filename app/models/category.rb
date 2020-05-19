class Category < ApplicationRecord
    has_many :travel_categories
    has_many :travels, through: :travel_categories

    def latest_traveling_article
        travels.max_by(&:created_at)
    end
end
