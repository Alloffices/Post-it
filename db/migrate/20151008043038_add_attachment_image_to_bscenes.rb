class AddAttachmentImageToBscenes < ActiveRecord::Migration
  def self.up
    change_table :bscenes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bscenes, :image
  end
end
