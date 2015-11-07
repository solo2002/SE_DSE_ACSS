class RemoveColumnScoreFromQuestions < ActiveRecord::Migration
  def change
  	  	remove_column :questions, :score
  end
end
