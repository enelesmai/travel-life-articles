class CategoriesController < ApplicationController
    def index

    end

    def new; end

    def create
    end

    def show
        @category = Category.find(params[:id])
        @travels_by_category = Category.find(params[:id]).travels
    end

end
