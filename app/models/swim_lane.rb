class SwimLane < ActiveRecord::Base
  belongs_to :board
  has_many :tasks

  scope :by_days, -> { order(days: :asc) }
end
