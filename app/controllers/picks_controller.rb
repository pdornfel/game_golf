class PicksController < ApplicationController

  def index
    @tournaments = Tournament.all
    @users = User.all
  end

  def create
    user = User.first
    player = Player.find(params[:pick][:player_id])
    tournament = Tournament.find(params[:tournament_id])
    Pick.create(user: user, player: player, tournament: tournament)
    redirect_to user_path(User.first)
  end

  def destroy
    tournament = Tournament.find(params[:id])
    user = User.first
    pick = Pick.find_by(tournament: tournament, user: user)
    if pick
      pick.destroy
      flash[:alert] = "succesfully deleted your pick"
      redirect_to user_path(User.first)
    else
      redirect_to user_path(User.first)
    end
  end

end