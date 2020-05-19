module TravelsHelper
    def featured_traveling_article
        Travel.all.includes(:votes).max_by { |t| t.votes.length }
    end

    def list_of_categories
        Category.all.order(:priority)
    end
end
