class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :status, :website, :header, :expiration_date
  belongs_to :user
end

