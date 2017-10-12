class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :user, foreign_key: true
      t.references :quiz, foreign_key: true
      t.integer :actscore
      t.timestamps
    end
    add_index :scores, [:user_id , :created_at]
    add_index :scores, [:quiz_id , :created_at]

  end
end
