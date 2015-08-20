class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def new_user(user)
  	@user = user
  	mail(subject: "New User: #{user.email}")
  end

end
