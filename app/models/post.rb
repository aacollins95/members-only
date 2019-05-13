class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 64 }
  validates :content, presence: true, length: { maximum: 1024 }
end
