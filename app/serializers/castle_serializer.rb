class CastleSerializer < ActiveModel::Serializer
  has_many :memories
  belongs_to :user
  attributes :id, :name, :user_id, :image, :memories
end
