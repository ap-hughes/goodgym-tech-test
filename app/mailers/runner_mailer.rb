class RunnerMailer < ApplicationMailer
  def bespoke_email(runner)
    @runner = runner
    @user = User.first
    @opening_content = "It's London Marathon week on Sunday, are you taking part?"
    case @runner.status
    when "regular" #for regular runner
      @bespoke_content = regular_runner(@runner)
      mail(to: @runner.email, subject: "Here's what we've been up to this week", reply_to: @user.email)
    when "lapsed" #for lapsed runner
      @bespoke_content = lapsed_runner(@runner)
      mail(to: @runner.email, subject: "It's been a while", reply_to: @user.email)
    when "never_run" #for never_run runner
      @bespoke_content = never_run_runner(@runner)
      mail(to: @runner.email, subject: "Make your first step into GoodGym", reply_to: @user.email)
    end
  end

  def regular_runner(runner)
    @runner = runner
    if @runner.preference.grouprun && @runner.preference.mission && @runner.preference.coachrun
      "trying this out"
    elsif @runner.preference.grouprun && @runner.preference.mission
      "On our group run this week we ran to help the local city farm.

Have you signed up to do a mission?"
    elsif @runner.preference.mission && @runner.preference.coachrun
      "test"
    elsif @runner.preference.grouprun && @runner.preference.coachrun
      "test"
    elsif @runner.preference.grouprun
      "On our group run this week we ran to help the local city farm."
    elsif @runner.preference.mission
      "Have you signed up to do a mission?"
    elsif @runner.preference.coachrun
      "test"
    else
      "Let me know if you need help deciding what run options might suit you."
    end
  end

  def lapsed_runner(runner)
    @runner = runner
    if @runner.preference.grouprun && @runner.preference.mission && @runner.preference.coachrun
      "trying this out"
    elsif @runner.preference.grouprun && @runner.preference.mission
      "On our group run this week we ran to help the local city farm - will we see you on a run with us soon?

Have you signed up to do a mission?"
    elsif @runner.preference.mission && @runner.preference.coachrun
      "Mission and coachrun"
    elsif @runner.preference.grouprun && @runner.preference.coachrun
      "Grouprun and coachrun"
    elsif @runner.preference.grouprun
      "On our group run this week we ran to help the local city farm - will we see you on a run with us soon?"
    elsif @runner.preference.mission
      "Have you signed up to do a mission?"
    elsif @runner.preference.coachrun
      "Coachrun"
    else
      "Let me know if you need help deciding what run options might suit you."
    end
  end

  def never_run_runner(runner)
    @runner = runner
    if @runner.preference.grouprun && @runner.preference.mission && @runner.preference.coachrun
      "trying this out"
    elsif @runner.preference.grouprun && @runner.preference.mission
      "On our group run this week we ran to help the local city farm.

Have you signed up to do a mission?"
    elsif @runner.preference.mission && @runner.preference.coachrun
      "test"
    elsif @runner.preference.grouprun && @runner.preference.coachrun
      "test"
    elsif @runner.preference.grouprun
      "On our group run this week we ran to help the local city farm."
    elsif @runner.preference.mission
      "Have you signed up to do a mission?"
    elsif @runner.preference.coachrun
      "How are you finding GoodGym so far? We'll have you running to a coach soon!"
    else
      "Let me know if you need help deciding what run options might suit you."
    end
  end
end
