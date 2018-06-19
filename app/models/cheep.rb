class Cheep < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :content,
  presence: true,
  length: { in: 1..140, allow_blank: true }

  mount_uploader :image, ImageUploader
end
