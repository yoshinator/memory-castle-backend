class CastleSerializer < ActiveModel::Serializer
  has_many :memories
  attributes :id, :name, :user_id, :image, :memories
end
