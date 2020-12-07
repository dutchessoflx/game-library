class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.create game_params
    redirect_to games_path
  end

  def index
    @games = Game.all
  end

  def show
    @game = Game.find params[:id]
  end

  def edit
    @game = Game.find params[:id]

  end

  def update
    @game= Game.find params[:id]
    @game.update game_params
    redirect_to game_path(@game.id)
  end

  def destroy
    Game.destroy params[:id]
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:title, :description, :user_id, :box_art)
  end


end
