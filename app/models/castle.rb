class Castle < ApplicationRecord
  belongs_to :user
  has_many :memories, dependent: :destroy
  has_one_attached :castle_image
  validate :acceptable_image

def acceptable_image
  return unless castle_image.attached?

  unless castle_image.byte_size <= 1.megabyte
    errors.add(:castle_image, "is too big")
  end

  acceptable_types = ["image/jpeg", "image/jpg" ,"image/png"]
  unless acceptable_types.include?(castle_image.content_type)
    errors.add(:castle_image, "must be a JPEG or PNG")
  end
end

end
