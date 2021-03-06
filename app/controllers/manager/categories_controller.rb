class Manager::CategoriesController < ApplicationController

    before_action :login_required

    def login_required
        redirect_to new_manager_session_path unless current_manager
    end

    def index
        @q = Category.ransack(params[:q])
        @categories = @q.result(distinct: true).where(active: true).page(params[:page]).per(10)
        @category = Category.new
    end

    def new
    end

    def create
        @category = Category.new(category_params)
    if  @category.save
        redirect_to manager_categories_path
    else
        @q = Category.ransack(params[:q])
        @categories = @q.result(distinct: true).where(active: true).page(params[:page]).per(10)
        render :index
    end
    end

    def show
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if params[:leave]
            @category.update(active:false)
            redirect_to manager_categories_path
        else
            if  @artist.update(category_params)
                redirect_to manager_categories_path
            else
                render :edit
            end
        end
    end

    def destroy
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end

end
