class AddFieldsToProjx < ActiveRecord::Migration
  def change
    add_column :projxes, :type_skill, :string
    add_column :projxes, :location, :string
  end
end
