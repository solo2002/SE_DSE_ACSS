class AddNoOfRoundsToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :no_of_rounds, :integer
  end
end
