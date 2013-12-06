class RenameColumn < ActiveRecord::Migration
  def up
    add_column :profiles, :firstname, :string
    add_column :profiles, :lastname, :string
    add_column :profiles, :fullname, :string
  end

  def down
    remove_column :profiles, :name
  end
end
