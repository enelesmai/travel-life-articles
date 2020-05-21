class TravelsController < ApplicationController
    def index
        @featured_traveling_article = featured_traveling_article
        @list_of_categories = list_of_categories
    end

    def new 
        @travel = current_user.travels.build
    end

    def create
        @travel = current_user.travels.build(travel_params)
        @travel.image = 'https://www.tourniagara.com/wp-content/uploads/2014/10/default-img.gif'

        @travel.travel_categories.build(category_id: 2)

        if @travel.save
          redirect_to @travel, notice: 'Traveling article created successfully'
        else
          render :new
        end
    end

    def show
        @travel = Travel.find(params[:id])
    
        @comment = Comment.new
        @comment.travel_id = @travel.id
    end

    def featured_traveling_article
        Travel.all.includes(:votes).max_by { |t| t.votes.length }
    end

    def list_of_categories
        Category.all.order(:priority).take(4)
    end

    def travel_params
        params.require(:travel).permit(:title, :text)
    end
end
