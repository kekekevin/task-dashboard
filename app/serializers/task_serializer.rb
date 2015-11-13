class TaskSerializer < ActiveModel::Serializer
  attributes :id, :summary, :description, :due_date, :swim_lane_id
end
