class Droptable < ActiveRecord::Migration
  def change
	drop_table :judges
  end
end
