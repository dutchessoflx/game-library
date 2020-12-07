class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.new name: params[:name]


  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    category = Category.find params[:id]
    category.update name: params[:name]
    redirect_to categories_path
  end

  def destroy
  end
end
