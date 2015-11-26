class AddExtraToProjx < ActiveRecord::Migration
  def change
    add_column :projxes, :website, :string
    add_column :projxes, :date, :string
    add_column :projxes, :stime, :string
    add_column :projxes, :etime, :string
  end
end
