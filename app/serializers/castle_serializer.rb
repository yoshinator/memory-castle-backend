class CastleSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  has_many :memories
  belongs_to :user
  attributes :id, :name, :user_id, :image, :memories, :castle_image
    
    def castle_image
        rails_blob_url(object.castle_image) if object.castle_image.attached?
    end
end
