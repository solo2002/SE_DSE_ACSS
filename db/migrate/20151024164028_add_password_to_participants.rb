class AddPasswordToParticipants < ActiveRecord::Migration
  def change
	add_column :participants, :password, :string
  end
end
