class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :lesson_id, foreign_key: true
      t.integer :choices_id, foreign_key: true
      t.integer :word_id, foreign_key: true

      t.timestamps
    end
  end
end
