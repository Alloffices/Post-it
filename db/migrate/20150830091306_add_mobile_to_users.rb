class AddMobileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :social_app, :string
  end
end
