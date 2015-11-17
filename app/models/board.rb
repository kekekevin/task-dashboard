class Board < ActiveRecord::Base
  has_many :swim_lanes

  def with_default_lanes
    today = SwimLane.new(name: 'Today', days: 0, order: 1)
    tomorrow = SwimLane.new(name: 'Tomorrow', days: 1, order: 2)
    one_week = SwimLane.new(name: 'One Week', days: 6, order: 3)
    one_month = SwimLane.new(name: 'One Month', days: 29, order: 4)

    self.swim_lanes = [today, tomorrow, one_week, one_month]
    self
  end

  def assign(task)
    lane = swim_lanes.by_days.find { |l| task.due_date <= Time.now.to_date + l.days.days }
    lane ||= swim_lanes.by_days.last
    lane.tasks << task
  end
  
end
