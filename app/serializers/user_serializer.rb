class UserSerializer < ActiveModel::Serializer
  has_many :castles
  attributes :id, :name, :castles
end
