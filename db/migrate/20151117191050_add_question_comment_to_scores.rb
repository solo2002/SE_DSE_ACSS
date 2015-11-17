class AddQuestionCommentToScores < ActiveRecord::Migration
  def change
    add_column :scores, :question_comment, :string
  end
end
