class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.references :subcategory, foreign_key: true
      t.timestamps
    end
    add_index :quizzes, [:subcategory_id, :created_at]
  end
end
