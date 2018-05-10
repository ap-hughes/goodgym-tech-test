require "rails_helper"

RSpec.describe RunnerMailer, type: :mailer do
  describe 'bespoke_email' do
    let(:user) { User.first }
    let(:runners) { Runner.all }
    let(:main_content) {"An interesting line"}
    let(:regular_title) { "Something" }
    let(:regular_grouprun) { "Something" }
    let(:regular_mission) { "Something" }
    let(:regular_coachrun) { "Something" }
    let(:lapsed_title) { "Something" }
    let(:lapsed_grouprun) { "Something" }
    let(:lapsed_mission) { "Something" }
    let(:lapsed_coachrun) { "Something" }
    let(:never_title) { "Something" }
    let(:never_grouprun) { "Something" }
    let(:never_mission) { "Something" }
    let(:never_coachrun) { "Something" }
    let(:mail) { described_class.bespoke_email(user, runners, main_content,
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
    never_coachrun).deliver_now }

    it 'renders the recipient email' do
      runners.each do |runner|
        expect(mail.to).to eq(runner.email)
      end
    end

    it 'assigns @name' do
      runners.each do |runner|
        expect(@name).to match(runner.first_name)
      end
    end
  end
end
