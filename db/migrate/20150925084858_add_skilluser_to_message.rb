class AddSkilluserToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :userskill, :string
  end
end
