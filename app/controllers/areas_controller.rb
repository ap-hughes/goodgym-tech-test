class AreasController < ApplicationController
  before_action :authenticate_user!, only: [:show, :mail]

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
  end

  def mail
    main_content = params[:mail][:maincontent]
    regular_title = params[:mail][:regulartitle]
    regular_grouprun = params[:mail][:regulargrouprun]
    regular_mission = params[:mail][:regularmission]
    regular_coachrun = params[:mail][:regularcoachrun]
    lapsed_title = params[:mail][:lapsedtitle]
    lapsed_grouprun = params[:mail][:lapsedgrouprun]
    lapsed_mission = params[:mail][:lapsedmission]
    lapsed_coachrun = params[:mail][:lapsedcoachrun]
    never_title = params[:mail][:nevertitle]
    never_grouprun = params[:mail][:nevergrouprun]
    never_mission = params[:mail][:nevermission]
    never_coachrun = params[:mail][:nevercoachrun]
    raise
    Mailer.mail_method(main_content,
    regular_title,
    regular_grouprun,
    regular_mission,
    regular_coachrun,
    lapsed_title,
    lapsed_grouprun,
    lapsed_mission,
    lapsed_coachrun,
    never_title,
    never_grouprun,
    never_mission,
    never_coachrun).deliver
  end
end
