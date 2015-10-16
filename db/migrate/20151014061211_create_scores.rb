class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
	t.belongs_to :participants
	t.belongs_to :judges
	t.belongs_to :rounds

      t.timestamps null: false
    end
  end
end
