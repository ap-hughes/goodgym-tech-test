# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Area.destroy_all

puts "Starting testing parameters seed"
london = Area.create!(location: "London")
manchester = Area.create!(location: "Manchester")

puts "Finished seeding Locations"

ant = User.create!(email: "ant@goodgym.org", password: "123456", area: london)
alex = User.create!(email: "alex@goodgym.org", password: "123456", area: manchester)

puts "Finished seeding Users"

# Patrick, is a regular runner who want to do GroupRun & Mission,
# Nina who is lapsed runner who want to do Group Run only
# Ivo who is a never_run who want just want to do CoachRun

a = Runner.create!(first_name: "Patrick", status: 0, user: ant)
b = Runner.create!(first_name: "Nina", status: 1, user: ant)
c = Runner.create!(first_name: "Ivo", status: 2, user: ant)

d = Runner.create!(first_name: "Jeff", status: 2, user: alex)
e = Runner.create!(first_name: "John", status: 1, user: alex)
f = Runner.create!(first_name: "Sarah", status: 0, user: alex)

puts "Finished seeding Runners"

Preference.create!(grouprun: true, mission: true, coachrun: false, runner: a)
Preference.create!(grouprun: true, mission: false, coachrun: false, runner: b)
Preference.create!(grouprun: false, mission: false, coachrun: true, runner: c)

Preference.create!(grouprun: false, mission: true, coachrun: true, runner: d)
Preference.create!(grouprun: true, mission: false, coachrun: true, runner: e)
Preference.create!(grouprun: false, mission: false, coachrun: false, runner: f)

puts "Finished seeding Runner Preferences"

puts "Seeding complete!"
