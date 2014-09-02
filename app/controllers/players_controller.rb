class PlayersController < ApplicationController

  def index
    @players = Player.order(:world_rank).limit(125)
  end


end