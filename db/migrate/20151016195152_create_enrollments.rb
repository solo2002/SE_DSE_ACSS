class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|

      t.timestamps null: false
    end
  end
end
