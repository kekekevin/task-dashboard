class TaskSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :summary, :description, :due_date
end
