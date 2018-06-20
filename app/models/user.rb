class User < ApplicationRecord

  has_many :cheeps, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_cheeps, through: :favorites, source: :cheep

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  before_save { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6, allow_blank: true }, on: :create

  mount_uploader :image, ImageUploader
end
