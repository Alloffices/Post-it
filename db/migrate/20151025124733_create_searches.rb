class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :type_skill
      t.string :location

      t.timestamps null: false
    end
  end
end
