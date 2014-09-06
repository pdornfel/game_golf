class PicksController < ApplicationController

  def index
    @tournaments = Tournament.all
    @users = User.all
  end

  def show
  end

end