class TaskSerializer < ActiveModel::Serializer
  attributes :id, :summary, :description, :due_date

  belongs_to :swim_lane_id
end
