class MessageMailer < ActionMailer::Base

	def message_created(user)
		mail(to: user.email,
			from: "no-reply@nobbble.com",
			subject: "Project Sent Confirmation"
			)
	end

end

