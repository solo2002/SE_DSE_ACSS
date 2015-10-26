class AddColumnsToJudges < ActiveRecord::Migration
  def change
    add_column :judges, :password, :string
  end
end
