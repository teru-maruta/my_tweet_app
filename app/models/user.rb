class User < ApplicationRecord
  has_many :pictures, -> { order(created_at: :desc) }
  validates :identification, presence: true, uniqueness: true
  validates :password, presence: true
end
