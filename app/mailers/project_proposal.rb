class PostProposalMailer < ActionMailer::Base

	def project_proposal_created(user)
		
		mail(to: user.email,
			from:,
			subject:,
			body:
			)
	end


end
