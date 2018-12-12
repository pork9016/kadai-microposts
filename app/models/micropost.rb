class Micropost < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :likes, class_name: 'Like', foreign_key: 'favorite_id'
  has_many :users, through: :likes 
end
