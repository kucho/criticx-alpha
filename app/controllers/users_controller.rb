class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]
  before_action :set_user, only: %i[show edit update destroy]
  layout 'welcome'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to games_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :birth_date, :email)
  end
end
