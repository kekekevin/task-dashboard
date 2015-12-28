class BoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :time_zone, :description, :swim_lane_ids
end
