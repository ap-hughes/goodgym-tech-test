class AreasController < ApplicationController
  before_action :authenticate_user!, only: [:show, :mail]

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    #only show area page to user(trainer) location
    @weekly_email = WeeklyEmail.new
    if current_user.area.location == @area.location
      @area
    else redirect_to areas_path
      flash[:alert] = "Sorry, this is not your area! You are in charge of runners in #{current_user.area.location}."
    end
  end
end
