MANDRILL_API_KEY = "p59tcGe-1P2bghAjbTdbmQ"

ActionMailer::Base.smtp_settings = {

	address: "smtp.mandrill.com",
	port: 587,
	enable_starttls_auto: true,
	username: "alloffices.nyc@gmail.com",
	password: "MANDRILL_API_KEY",
	authentication: "login"

}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"