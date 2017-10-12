  class CreateLequizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :lequizzes do |t|
      t.references :quiz, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :actscore

      t.timestamps
    end
    add_index :lequizzes, [:quiz_id, :created_at]
    add_index :lequizzes, [:user_id, :created_at]
  end
end
