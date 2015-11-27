class AddColumnCategoryToQuestions < ActiveRecord::Migration
  def change
	add_column :questions, :category, :string
	remove_column :questions, :question_detail
  end
end
