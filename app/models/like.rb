class Like < ApplicationRecord
  belongs_to :user
  belongs_to :favorite, class_name: "Micropost"
 
end
