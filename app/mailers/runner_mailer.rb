class RunnerMailer < ApplicationMailer
  def bespoke_email(user, runner, weekly_email)
    @user = user
    @weekly_email = weekly_email
    @name = runner.first_name
    case runner.status
    when "regular" #for regular runner
      @bespoke_content = regular_runner(runner, @weekly_email.regular_title, @weekly_email.regular_mission, @weekly_email.regular_coachrun)
      mail(to: runner.email, subject: @weekly_email.regular_title, reply_to: @user.email)
    when "lapsed" #for lapsed runner
      @bespoke_content = lapsed_runner(runner, @weekly_email.lapsed_grouprun, @weekly_email.lapsed_mission, @weekly_email.lapsed_coachrun)
      mail(to: runner.email, subject: @weekly_email.lapsed_title, reply_to: @user.email)
    when "never_run" #for never_run runner
      @bespoke_content = never_run_runner(runner, @weekly_email.never_grouprun, @weekly_email.never_mission, @weekly_email.never_coachrun)
      mail(to: runner.email, subject: @weekly_email.never_title, reply_to: @user.email)
    end
  end

  def regular_runner(runner, regular_grouprun, regular_mission, regular_coachrun)
    if runner.preference.grouprun && runner.preference.mission && runner.preference.coachrun
      regular_grouprun + "\r\r" + regular_mission + "\r\r" + regular_coachrun
    elsif runner.preference.grouprun && runner.preference.mission
      regular_grouprun + "\r\r" + regular_mission
    elsif runner.preference.mission && runner.preference.coachrun
      regular_mission + "\r\r" + regular_coachrun
    elsif runner.preference.grouprun && runner.preference.coachrun
      regular_grouprun + "\r\r" + regular_coachrun
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
      lapsed_grouprun + "\r\r" + lapsed_mission + "\r\r" + lapsed_coachrun
    elsif runner.preference.grouprun && runner.preference.mission
      lapsed_grouprun + "\r\r" + lapsed_mission
    elsif runner.preference.mission && runner.preference.coachrun
      lapsed_mission + "\r\r" + lapsed_coachrun
    elsif runner.preference.grouprun && runner.preference.coachrun
      lapsed_grouprun + "\r\r" + lapsed_coachrun
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
      never_grouprun + "\r\r" + never_mission + "\r\r" + never_coachrun
    elsif runner.preference.grouprun && runner.preference.mission
      never_grouprun + "\r\r" + never_mission
    elsif runner.preference.mission && runner.preference.coachrun
      never_mission + "\r\r" + never_coachrun
    elsif runner.preference.grouprun && runner.preference.coachrun
      never_grouprun + "\r\r" + never_coachrun
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
