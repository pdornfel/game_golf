class PicksController < ApplicationController

  def index
    @schedule = Tournament.all
    @users = User.all
  end

end