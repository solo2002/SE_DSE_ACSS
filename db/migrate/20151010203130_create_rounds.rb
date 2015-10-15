class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
	t.belongs_to :competition, :index: true
	t.string :round_name
	t.text :round_des
	t.integer :no_of_participants

      t.timestamps null: false
    end

  end
end
