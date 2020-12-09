class PagesController < ApplicationController
  def home
    @loans = @current_user.loans
  end

  def search
    if params[:search].blank?

    else
      @parameter = params[:search].downcase
      @results = Category.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").order("categories.name DESC")
      # @results = User.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").order("users.name DESC")
      # @results = Game.all.where("lower(title) LIKE :search", search: "%#{@parameter}%").order("games.title DESC")
      # @results = Loan.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").order("loans.name DESC")
    end
  end

  # def search_games
  #   if params[:search].blank?
  #     redirect_to(root_path, alert: "Empty field!") and return
  #   else
  #     @parameter = params[:search_games].downcase
  #     @g_results = Game.all.where("lower(title) LIKE :search", search_games: "%#{@parameter}%").order("games.name DESC")
  #     # @results = User.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").order("users.name DESC")
  #     # @results = Game.all.where("lower(title) LIKE :search", search: "%#{@parameter}%").order("games.title DESC")
  #     # @results = Loan.all.where("lower(name) LIKE :search", search: "%#{@parameter}%").order("loans.name DESC")
  #   end
  # end
end
