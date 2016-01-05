class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
		t.belongs_to :participant
		t.belongs_to :judge
		t.belongs_to :round
		t.string :comment_des
      t.timestamps null: false
    end
  end
end
