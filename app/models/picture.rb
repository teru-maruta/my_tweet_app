class Picture < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 1..30 }
  validates :file_name, presence: true
end
