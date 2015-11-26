class AddExtrafieldToProjx < ActiveRecord::Migration
  def change
    add_column :projxes, :budget, :integer
  end
end
