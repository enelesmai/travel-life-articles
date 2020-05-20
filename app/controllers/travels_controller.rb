class TravelsController < ApplicationController
    def index
        @featured_traveling_article = featured_traveling_article
        @list_of_categories = list_of_categories
    end
    
    def featured_traveling_article
        Travel.all.includes(:votes).max_by { |t| t.votes.length }
    end

    def list_of_categories
        Category.all.order(:priority)
    end
end
