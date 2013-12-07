class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :bio
      t.string :newsfeed
      t.string :twitter
      t.string :facebook
      t.string :quote
      t.string :personal_site
      t.belongs_to :category
      t.belongs_to :user

      t.timestamps
    end
  end
end
