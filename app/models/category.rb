class Category < ApplicationRecord
  

  default_scope -> { order('created_at DESC')}
 
  validates :title, presence: true
  validates :description, presence: true,
  length: { maximum: 100 }
  has_many :words, dependent: :destroy
  


end

