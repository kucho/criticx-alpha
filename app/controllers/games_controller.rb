class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]
  def index
    @games = Game.all
  end

  def show
    @platforms = @game.platforms.map(&:name).join(', ')
    @genres = @game.genres.map(&:name).join(', ')
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :summary, :release_date, :category, :rating, :parent_id)
  end
end
