class CreateLecategories < ActiveRecord::Migration[5.1]
  def change
    create_table :lecategories do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :actscore

      t.timestamps
    end
    add_index :lecategories, [:category_id, :created_at]
    add_index :lecategories, [:user_id, :created_at]

  end
end
