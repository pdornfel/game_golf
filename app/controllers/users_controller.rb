class UsersController < ApplicationController

  before_filter :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to users_path, notice: "Signed up"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @tournaments = Tournament.all_2015
    @players = Player.all.ranked
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end

end