class PagesController < ApplicationController
  def home

  end

  # def search
  #   if params[:search].blank?
  #
  #   else
  #     @parameter = params[:search].downcase
  #     @results = Category.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").order("categories.name DESC")
  #
  #   end
  # end    -code for a search function currently only searches one class and errors if you navigate off the page without searching

end
