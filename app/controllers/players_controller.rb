class PlayersController < ApplicationController

  before_filter :require_login

  def index
    @players = Player.order(:world_rank).limit(125)
    @group = Group.find(params[:group_id])
  end


end