class AddUserfieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :skill, :string
    add_column :users, :location, :string
    add_column :users, :about, :text
  end
end
