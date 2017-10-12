class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.references :user, foreign_key: true
      t.references :quiz, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
    add_index :states, [:user_id , :created_at]
    add_index :states, [:quiz_id , :created_at]
    add_index :states, [:question_id , :created_at]


  end
end
