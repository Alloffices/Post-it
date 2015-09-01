class AddUserIdToProjectProposal < ActiveRecord::Migration
  def change
    add_column :project_proposals, :user_id, :integer
  end
end
