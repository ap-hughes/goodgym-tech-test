# Preview all emails at http://localhost:3000/rails/mailers/runner_mailer
class RunnerMailerPreview < ActionMailer::Preview
  def bespoke_email
    user = User.first
    runners = Runner.take(4)
    main_content = "Something interesting to say."
    regular_title = "Testing regular title"
    regular_grouprun = "Testing regular grouprun"
    regular_mission = "Testing regular mission"
    regular_coachrun = "Testing regular coachrun"
    lapsed_title = "Testing lapsed title"
    lapsed_grouprun = "Testing lapsed grouprun"
    lapsed_mission = "Testing lapsed mission"
    lapsed_coachrun = "Testing lapsed coachrun"
    never_title = "Testing never title"
    never_grouprun = "Testing never grouprun"
    never_mission = "Testing never mission"
    never_coachrun = "Testing never coachrun"
    RunnerMailer.bespoke_email(user, runners, main_content,
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
  end
end
