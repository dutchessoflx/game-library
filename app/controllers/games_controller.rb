class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    # raise 'hell'
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
    # available?
  end

  def show
    @game = Game.find params[:id]
    @loan = Loan.find_by(game_id: params[:id])
    @categories = Category.where(game_id: params[:id])
    available?
    # raise 'hell'

  end

  def edit
    @game = Game.find params[:id]
      # @game.available?
    # redirect_to login_path unless @game.user_id == @current_user.id

  end

  def update
    @game= Game.find params[:id]
    # redirect_to login_path and return unless game.user_id == @current_user.id
    @game.categories.delete_all
    if params[:game][:category_id].any?
      @game.categories << Category.find(params[:game][:category_id])
    end
    @game.update game_params

    # raise 'hell'
    redirect_to game_path(@game.id)
  end

  def destroy
    Game.destroy params[:id]
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:title, :description, :min_players, :max_players, :available, :contents, :missing_damage, :user_id, :category_id, :box_art)
  end


end
