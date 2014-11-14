class TournamentsController < ApplicationController

	before_filter :get_group

  def show
    @tournament = Tournament.find(params[:id])
  end

  private

  def get_group
  	@group = Group.find(params[:group_id])
  end

end