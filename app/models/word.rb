class Word < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  belongs_to :category

  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  has_many :answers, dependent: :destroy

  validate :only_one_correct_answer

  def word_choices
    choices.find_by(correct_ans: true).content
  end
  
  private

  def only_one_correct_answer
    correct_counter = choices.collect{|c| c.correct_ans }.count(true)
    if correct_counter >= 2
      errors.add(:choice, 'Must have only one correct answer')
    elsif correct_counter == 0
      errors.add(:choice, 'Must have one correct answer')
    end 
  end


  
end
