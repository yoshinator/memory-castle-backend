class User < ApplicationRecord
  has_many :castles, dependent: :destroy
end
