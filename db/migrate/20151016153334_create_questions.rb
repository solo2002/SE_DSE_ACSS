class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
	t.belongs_to :participants
	t.belongs_to :rounds
	t.belongs_to :competitions
      t.timestamps null: false
    end
  end
end
