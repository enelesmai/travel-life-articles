class TravelsController < ApplicationController
    def index
        @featured_traveling_article = featured_traveling_article
        @list_of_categories = list_of_categories
        @no_footer = true
    end

    def new 
        @travel = current_user.travels.build
        @categories = Category.all.order(:priority)
    end

    def create
        @travel = current_user.travels.build(travel_params)
        @travel.category_ids = params[:category_ids]
        
        if @travel.save
            redirect_to @travel, notice: 'Traveling article created successfully'
        else
            @categories = Category.all.order(:priority)
            flash.notice = 'Fill in the required fields'
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
        Category.all.order(:priority).includes(:travels).take(3)
    end

    def travel_params
        params.require(:travel).permit(:title, :text, :image)
    end
end
