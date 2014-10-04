class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Signed up"
    else
      render :new
    end
  end

  def show
    @tournaments = Tournament.all
    @users = User.find(params[:id])
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