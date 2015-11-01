class SwimLaneSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :days, :order

  has_many :tasks
end
