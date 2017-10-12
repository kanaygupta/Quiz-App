class CreateLesubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :lesubcategories do |t|
      t.references :subcategory, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :actscore

      t.timestamps
    end
    add_index :lesubcategories, [:subcategory_id, :created_at]
    add_index :lesubcategories, [:user_id, :created_at]
  end
end
