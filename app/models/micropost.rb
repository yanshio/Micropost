class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  has_many :favorites, dependent: :destroy #MicropostがFavoriteと1対多
  has_many :favorited, through: :favorites, source: :user
  

  
  
end
