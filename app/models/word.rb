class Word < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  belongs_to :category

  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

end
