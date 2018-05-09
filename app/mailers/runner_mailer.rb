class RunnerMailer < ApplicationMailer
  def bespoke_email(user, runners, main_content,
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
    never_coachrun)
    @user = user
    @main_content = main_content
    @runners = runners
    @runners.each do |runner|
      @name = runner.first_name
      case runner.status
      when "regular" #for regular runner
        @bespoke_content = regular_runner(runner, regular_grouprun, regular_mission, regular_coachrun)
        mail(to: runner.email, subject: regular_title, reply_to: @user.email)
      when "lapsed" #for lapsed runner
        @bespoke_content = lapsed_runner(runner, lapsed_grouprun, lapsed_mission, lapsed_coachrun)
        mail(to: runner.email, subject: lapsed_title, reply_to: @user.email)
      when "never_run" #for never_run runner
        @bespoke_content = never_run_runner(runner, never_grouprun, never_mission, never_coachrun)
        mail(to: runner.email, subject: never_title, reply_to: @user.email)
      end
    end
  end

  def regular_runner(runner, regular_grouprun, regular_mission, regular_coachrun)
    if runner.preference.grouprun && runner.preference.mission && runner.preference.coachrun
      regular_grouprun + regular_mission + regular_coachrun
    elsif runner.preference.grouprun && runner.preference.mission
      regular_grouprun + regular_mission
    elsif runner.preference.mission && runner.preference.coachrun
      regular_mission + regular_coachrun
    elsif runner.preference.grouprun && runner.preference.coachrun
      regular_grouprun + regular_coachrun
    elsif runner.preference.grouprun
      regular_grouprun
    elsif runner.preference.mission
      regular_mission
    elsif runner.preference.coachrun
      regular_coachrun
    else
      "Notice your running preferences have disappeared. All OK?"
    end
  end

  def lapsed_runner(runner, lapsed_grouprun, lapsed_mission, lapsed_coachrun)
    if runner.preference.grouprun && runner.preference.mission && runner.preference.coachrun
      lapsed_grouprun + lapsed_mission + lapsed_coachrun
    elsif runner.preference.grouprun && runner.preference.mission
      lapsed_grouprun + lapsed_mission
    elsif runner.preference.mission && runner.preference.coachrun
      lapsed_mission + lapsed_coachrun
    elsif runner.preference.grouprun && runner.preference.coachrun
      lapsed_grouprun + lapsed_coachrun
    elsif runner.preference.grouprun
      lapsed_grouprun
    elsif runner.preference.mission
      lapsed_mission
    elsif runner.preference.coachrun
      lapsed_coachrun
    else
      "Let me know if you want to get back in to running."
    end
  end

  def never_run_runner(runner, never_grouprun, never_mission, never_coachrun)
    if runner.preference.grouprun && runner.preference.mission && runner.preference.coachrun
      never_grouprun + never_mission + never_coachrun
    elsif runner.preference.grouprun && runner.preference.mission
      never_grouprun + never_mission
    elsif runner.preference.mission && runner.preference.coachrun
      never_mission + never_coachrun
    elsif runner.preference.grouprun && runner.preference.coachrun
      never_grouprun + never_coachrun
    elsif runner.preference.grouprun
      never_grouprun
    elsif runner.preference.mission
      never_mission
    elsif runner.preference.coachrun
      never_coachrun
    else
      "Let me know if you need help deciding what run options might suit you."
    end
  end
end
