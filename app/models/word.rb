class Word < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  belongs_to :category

end
