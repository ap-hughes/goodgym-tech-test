# Preview all emails at http://localhost:3000/rails/mailers/runner_mailer
class RunnerMailerPreview < ActionMailer::Preview
  def bespoke_email
    runner = Runner.first
    RunnerMailer.bespoke_email(runner)
  end
end
