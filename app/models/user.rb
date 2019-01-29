class User < ApplicationRecord
  has_secure_password
  has_many :castles, dependent: :destroy
  validates :name, uniqueness: { case_sensitive: false }
end
