# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
board = Board.create({name: "Kevin's Tasks", time_zone: "America/Chicago", description: "random stuff that i need to do"})

today = SwimLane.create({board: board, order: 1, name: "Today", days: 1})
tomorrow = SwimLane.create({board: board, order: 2, name: "Tomorrow", days: 2})
one_week = SwimLane.create({board: board, order: 3, name: "One Week", days: 7})
one_month = SwimLane.create({board: board, order: 4, name: "One Month", days: 30})

task1 = Task.create({summary: "task1", due_date: Time.now, swim_lane: today})
task2 = Task.create({summary: "task2", due_date: Time.now + 1.day, swim_lane: tomorrow})
task3 = Task.create({summary: "task3", due_date: Time.now + 1.week, swim_lane: one_week})
task4 = Task.create({summary: "task4", due_date: Time.now + 1.month, swim_lane: one_month})
