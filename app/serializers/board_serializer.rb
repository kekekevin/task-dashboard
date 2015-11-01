class BoardSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :time_zone, :description

  has_many :swim_lanes
end
