class SwimLane < ActiveRecord::Base
  belongs_to :board
  has_many :tasks
end
