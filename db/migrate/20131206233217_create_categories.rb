class CreateCategories < ActiveRecord::Migration
	def change
		create_table :categories do |t|
			t.string :name
			t.belongs_to :profile
		end
	end
end
