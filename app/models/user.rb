class User < ApplicationRecord
  validates :identification, presence: true, uniqueness: true
  validates :password, presence: true
end
