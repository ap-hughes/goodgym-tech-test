class WeeklyEmail
  include ActiveModel::Model

  attr_accessor :user, :runner, :main_content,
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
      :never_coachrun

end
