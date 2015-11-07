class AddColumnMarksToScores < ActiveRecord::Migration
  def change
  	add_column :scores, :marks, :integer
  end
end
