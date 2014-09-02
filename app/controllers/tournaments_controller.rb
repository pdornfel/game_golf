class TournamentsController < ApplicationController
  def index
    @schedule = Sportsdata.golf.tournament_schedule
  end
end