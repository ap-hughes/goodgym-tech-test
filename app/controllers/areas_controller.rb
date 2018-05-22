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

  def mail
    @weekly_email = WeeklyEmail.new(mail_params)
    #Grab content from form
    runners = current_user.runners
    user = current_user

    #Loop over runners
    runners.each do |runner|
      RunnerMailer.bespoke_email(user, runner, @weekly_email).deliver
    end

    #Redirect user
    redirect_to areas_path
    flash[:alert] = "Emails sent!"
  end

  private

  def mail_params
    params.require(:weekly_email).permit(:main_content,
      :regular_title,
      :regular_grouprun,
      :regular_mission,
      :regular_coachrun,
      :lapsed_title,
      :lapsed_grouprun,
      :lapsed_mission,
      :lapsed_coachrun,
      :never_title,
      :never_grouprun,
      :never_mission,
      :never_coachrun)
  end
end
