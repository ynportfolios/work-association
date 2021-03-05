class User < ApplicationRecord
   has_secure_password
   validates :password, presence: true, length: { minimum: 6 }

   has_many :blogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog
end
