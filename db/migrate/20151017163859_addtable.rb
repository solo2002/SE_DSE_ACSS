class Addtable < ActiveRecord::Migration
  def change
	create_table :judges do |t|
        t.string :j_name
        t.string :j_loc
        t.string :j_phone
        t.string :j_email
        t.string :j_des
        t.timestamps null: false
    end

  end
end
