class TournamentsController < ApplicationController
  def index
    @schedule = Tournament.all
    @users = User.all
  end
end