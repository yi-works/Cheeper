class Cheep < ApplicationRecord

  belongs_to :user

  validates :content,
  presence: true,
  length: { in: 1..140, allow_blank: true }
end
