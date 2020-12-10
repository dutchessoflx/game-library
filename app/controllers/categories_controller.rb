class CategoriesController < ApplicationController
  before_action :check_for_admin, :only => [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_params
    redirect_to login_path unless session[:user_id] == @current_user.id ###only users can add new categories
    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
    @game = Game.where(category_id: params[:id])
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    category = Category.find params[:id]
    category.update category_params
    redirect_to categories_path
  end

  def destroy
    Category.destroy params[:id]
    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
