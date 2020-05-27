class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]
  def index
    @games = Game.all
  end

  def show
    @platforms = @game.platforms.map(&:name).join(', ')
    @genres = @game.genres.map(&:name).join(', ')
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to(@game)
    else
      render :edit
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :summary, :release_date, :category, :rating, :parent_id)
  end
end
