class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
	t.belongs_to :participant
	t.belongs_to :round

      t.timestamps null: false
    end
  end
end
