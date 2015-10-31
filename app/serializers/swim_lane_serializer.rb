class SwimLaneSerializer < ActiveModel::Serializer
  attributes :id, :name, :days, :order

  has_many :tasks
  belongs_to :board_id
end
