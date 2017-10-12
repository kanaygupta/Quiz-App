class AddActscoreToScores < ActiveRecord::Migration[5.1]
  def change
    add_column :scores, :actscore, :integer
  end
end
