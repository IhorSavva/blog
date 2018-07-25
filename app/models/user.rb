class User < ApplicationRecord
  has_many :posts

  validates :username, presence: true, uniqueness: true, length: {maximum: 50}
  validates :password, length: {minimum: 6}, presence: true, allow_nil: true
end
