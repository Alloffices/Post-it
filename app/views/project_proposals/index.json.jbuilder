json.array!(@project_proposals) do |project_proposal|
  json.extract! project_proposal, :id, :title, :description
  json.url project_proposal_url(project_proposal, format: :json)
end
