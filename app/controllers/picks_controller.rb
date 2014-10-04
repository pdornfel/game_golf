class PicksController < ApplicationController

  def index
    @tournaments = Tournament.all
    @users = User.all
  end

  def create
    user = current_user
    player = Player.find(params[:pick][:player_id])
    tournament = Tournament.find(params[:tournament_id])
    pick = Pick.find_or_initialize_by(user: user, tournament: tournament)
    pick.player = player

    if pick
      pick.save
      flash[:success] = "Succesfully created a new pick"
      redirect_to user_path(user)
    else
      flash[:alert] = "Unable to create pick"
      redirect_to user_path(user)
    end
  end

  def destroy
    tournament = Tournament.find(params[:id])
    user = current_user
    pick = Pick.find_by(tournament: tournament, user: user)
    if pick
      pick.destroy
      flash[:error] = "Succesfully destroyed your pick"
      redirect_to user_path(user)
    else
      redirect_to user_path(user)
    end
  end

end