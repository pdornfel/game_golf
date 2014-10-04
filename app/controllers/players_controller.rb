class PlayersController < ApplicationController

  before_filter :require_login

  def index
    @players = Player.order(:world_rank).limit(125)
  end


end