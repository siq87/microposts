class Micropost < ApplicationRecord
  belongs_to :user
  
  #いいね機能
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user #likesを通じた複数のuser(１つの投稿にいいねした全user)
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
end
