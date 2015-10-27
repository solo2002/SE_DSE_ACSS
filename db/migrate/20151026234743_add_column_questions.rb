class AddColumnQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :question_detail, :string
  end
end
