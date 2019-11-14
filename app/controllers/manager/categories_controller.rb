class Manager::CategoriesController < ApplicationController

    def index
        @categories = Category.all
        @category = Category.new
    end

    def new
    end

    def create
        @category = Category.new(category_params)
        @category.save
        redirect_to manager_categories_path
    end

    def show
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
    end

    def destory
        category = Category.find(params[:id])
        category.destory
        redirect_to manager_categories_path
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

end
