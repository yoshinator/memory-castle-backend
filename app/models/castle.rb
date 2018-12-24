class Castle < ApplicationRecord
  belongs_to :user
  has_many :memories, dependent: :destroy
end
