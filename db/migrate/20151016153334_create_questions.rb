class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
	t.string :question_details
	t.integer :marks
	t.belongs_to :round
	 t.timestamps null: false
    end
  end
end
