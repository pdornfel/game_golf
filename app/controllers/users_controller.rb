class UsersController < ApplicationController

  def show
    @tournaments = Tournament.all
    @users = User.find(params[:id])
    @players = Player.all.ranked
  end

  def index
    @users = User.all
  end

end