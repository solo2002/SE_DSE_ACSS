class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
	t.belongs_to :participants, :judges, :rounds

      t.timestamps null: false
    end
  end
end
