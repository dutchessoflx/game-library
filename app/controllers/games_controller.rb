class GamesController < ApplicationController
  before_action :check_for_admin, :only => [:edit, :update, :destroy]

  def new
    @game = Game.new
  end

  def create
    @game = Game.create game_params

    @game.categories << Category.find(params[:game][:category_id])
    if params[:game][:box_art].present?
      response = Cloudinary::Uploader.upload params[:game][:box_art]
      p response
      #save response Id into the appropriate field of our new model
      @game.box_art = response["public_id"]

    end
    @game.user_id = @current_user.id
    @game.save
    redirect_to games_path

  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find params[:id]
    @loan = @game.loans.find_by("TIMESTAMP 'now' >= start_date AND TIMESTAMP 'now' <= end_date")
    @categories = Category.where(game_id: params[:id])
  end

  def edit
    @game = Game.find params[:id]
    flash[:error] = "Only The Owner of that game can edit it" unless @game.user_id == @current_user.id || @current_user.admin?
  end

  def update
    @game= Game.find params[:id]
    flash[:error] = "Only The Owner of that game can edit it" and return unless @game.user_id == @current_user.id || @current_user.admin?
    @game.categories.delete_all
    if params[:game][:category_id].any?
      @game.categories << Category.find(params[:game][:category_id])
    end
    @game.update game_params
    redirect_to game_path(@game.id)
  end

  def destroy
    Game.destroy params[:id]
    flash[:error] = "Only The Owner of that game can edit it" unless @game.user_id == @current_user.id || @current_user.admin?
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:title, :description, :min_players, :max_players, :available, :contents, :missing_damage, :user_id, :category_id, :box_art)
  end


end
