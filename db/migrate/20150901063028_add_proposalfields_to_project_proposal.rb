class AddProposalfieldsToProjectProposal < ActiveRecord::Migration
  def change
    add_column :project_proposals, :location, :string
    add_column :project_proposals, :budget, :integer
  end
end
