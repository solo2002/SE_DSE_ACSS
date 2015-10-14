class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
	t.string :p_name
	t.string :p_loc
	t.string :p_phone
	t.string :p_email
	t.string :p_des
	t.integer :round_id
	t.timestamps null: false
    end

  end
end
