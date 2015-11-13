class Task < ActiveRecord::Base
  belongs_to :swim_lane
  belongs_to :board

  def assign
    board.assign self
  end
end
