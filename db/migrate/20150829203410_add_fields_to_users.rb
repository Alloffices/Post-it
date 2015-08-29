class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :skill, :string
    add_column :users, :msg, :string
  end
end
