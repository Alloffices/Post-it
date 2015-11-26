class Message < ActiveRecord::Base
	attr_reader :user_tokens

	belongs_to :sender, class_name: 'User'

	has_many :recipients
	has_many :users, :through => :recipients

	# user contact message validations
	validates :sender_id, presence: true
	validates :title, presence: true
	validates :description, presence: true
	validates :budget, presence: true
	validates :location, presence: true
	validates :date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :skill, presence: true


	def user_tokens=(ids)
		self.user_ids = ids
	end

end
