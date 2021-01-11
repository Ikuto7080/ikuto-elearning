class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.string :choices
      t.string :correct_ans
      t.integer :word_id

      t.timestamps
    end
  end
end
