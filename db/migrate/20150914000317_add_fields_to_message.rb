class AddFieldsToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :description, :text
    add_column :messages, :location, :string
    add_column :messages, :budget, :integer
    add_column :messages, :date, :string
    add_column :messages, :start_time, :string
    add_column :messages, :end_time, :string
  end
end
