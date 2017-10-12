class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :quiz, foreign_key: true
      t.text :content
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d
      t.string :answer
      t.string :q_type
      t.timestamps
    end
    add_index :questions, [:quiz_id, :created_at]
  end
end
