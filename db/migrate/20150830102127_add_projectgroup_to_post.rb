class AddProjectgroupToPost < ActiveRecord::Migration
  def change
    add_column :posts, :group, :string
  end
end