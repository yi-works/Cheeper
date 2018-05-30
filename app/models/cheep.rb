class Cheep < ApplicationRecord
  validates :content,
  presence: true,
  length: { in: 1..140, allow_blank: true }
end
