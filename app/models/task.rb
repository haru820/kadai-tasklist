class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :status, presence: true, length: { maximum: 10 }
end
