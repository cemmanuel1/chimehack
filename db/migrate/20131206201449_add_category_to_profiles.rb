class AddCategoryToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :category, :string
  end
end
