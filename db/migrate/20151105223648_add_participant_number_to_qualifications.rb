class AddParticipantNumberToQualifications < ActiveRecord::Migration
  def change
    add_column :qualifications, :participant_number, :integer
  end
end
