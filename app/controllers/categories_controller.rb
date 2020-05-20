class CategoriesController < ApplicationController
    def index

    end

    def new; end

    def create
    end

    def show
        @category_name = Category.find(params[:id]).name
        @travels_by_category = Category.find(params[:id]).travels
    end

end
