class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :bio
      t.string :newsfeed
      t.string :img
      t.string :twitter
      t.string :facebook
      t.string :quote
      t.string :personal_site
      t.text :video
      t.boolean :speaking
      t.belongs_to :category
      t.belongs_to :user

      t.timestamps
    end
  end
end
