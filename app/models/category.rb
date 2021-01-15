class Category < ApplicationRecord
  

  default_scope -> { order('created_at DESC')}
 
  validates :title, presence: true
  validates :description, presence: true,
  length: { maximum: 100 }
  has_many :words, dependent: :destroy

  has_many :lessons, dependent: :destroy
  has_many :users, through: :lessons
  
  


end

