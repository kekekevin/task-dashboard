class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :time_zone, :description

  has_many :swim_lanes
end
