class Word < ApplicationRecord
  validates :category_id, presence: true
  validates :word, uniqueness: true, presence: true
  belongs_to :category

end
