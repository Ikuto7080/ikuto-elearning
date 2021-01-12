class Word < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  belongs_to :category

  has_many :choices, dependent: :destroy

end
