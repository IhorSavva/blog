class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, allow_nil: true, length: {maximum: 100}
  validates :text, presence: true, allow_nil: true
end
