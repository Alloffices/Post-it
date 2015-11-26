class MessagesController < ApplicationController
	before_action :authenticate_user!, except: [:new]

	def new
		@message = Message.new
		@recipients = User.all
		@recipient = User.find_by(id: params[:to].to_i) if params[:to]
		@chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
		@user = User.find_by(id: params[:user])
	end



	def create
		@user = current_user

		@message = current_user.messages.build(message_params)
		if @message.save
			# email notifications to @recipient with Mandrill
			MessageMailer.message_created(@user).deliver_now
			flash[:success] = "Message Sent!"
			redirect_to user_path(@user)
		else
			flash[:alert] = "Nothing Happend!"
			render 'new'
		end
	end

	def index
		@messages = Recipient.where(:user_id => current_user.id).order('created_at DESC')
	end

	private

	def message_params
		params.require(:message).permit(:title, :description, :budget, :location, :date, :userskill, :start_time, :end_time, :skill, :sender_id, user_tokens: [])
	end

end
