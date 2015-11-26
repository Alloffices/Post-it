class User < ActiveRecord::Base
  acts_as_voter

  # [x] Mandrill email new user / send notification
  after_create :send_notification

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # [x] paperclip avatar image validations
  has_attached_file :avatar, styles: { medium: "50x50#", thumb: "30x30#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # User model associations
  has_many :projxes
  has_many :bscenes

  # [x] Messages has many :thorugh association
  has_many :messages, foreign_key: :sender_id

  # [x] User followers/following associations through Relationships
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Create the other_user method used for user follow and unfollow relationships
  def other_user
     self.current_user = true
  end

  # Mandrill after create method
  def send_notification
  	AdminMailer.new_user(self).deliver_now
  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end












