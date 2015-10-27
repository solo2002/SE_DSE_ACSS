class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
	t.belongs_to :participant
	t.belongs_to :judge
	t.belongs_to :round

      t.timestamps null: false
    end
  end
end
