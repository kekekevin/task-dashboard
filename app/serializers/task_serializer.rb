class TaskSerializer < ActiveModel::Serializer
  attributes :id, :summary, :description, :due_date
end
