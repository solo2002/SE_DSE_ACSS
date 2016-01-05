class JudgeCompJoin < ActiveRecord::Migration
	def self.up
		create_table :competitions_judges, :id => false do |t|
			t.integer :judge_id
			t.integer :competition_id
		end
	end
	def self.down
		drop_table :competitions_judges
	end
end
