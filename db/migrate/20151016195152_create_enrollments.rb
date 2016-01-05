class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
	t.belongs_to :participant
	t.belongs_to :competition
      t.timestamps null: false
    end
  end
end
