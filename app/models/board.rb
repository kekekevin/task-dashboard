class Board < ActiveRecord::Base
  has_many :swim_lanes

  before_create do |board|
    today = SwimLane.new(name: 'Today', days: 1, order: 1)
    tomorrow = SwimLane.new(name: 'Tomorrow', days: 2, order: 2)
    one_week = SwimLane.new(name: 'One Week', days: 7, order: 3)
    one_month = SwimLane.new(name: 'One Month', days: 30, order: 4)

    board.swim_lanes = [today, tomorrow, one_week, one_month]
  end
end
