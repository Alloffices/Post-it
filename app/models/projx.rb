class Projx < ActiveRecord::Base
    acts_as_votable

    validates :title, :description, :location, :type_skill, :date, presence: true

    belongs_to :user
    has_many :bscenes, dependent: :destroy

    def self.search(search)
      if search
        where(['type_skill LIKE ?', "%#{search}%"])
      else
        all
      end
    end

    # validate :user_quota, :on => :create
    # private

    # def user_quota
    #   if user.projxes.size >= 4
    #       errors.add(:base, "Exceeds daily limit")
    #   elsif user.projxes.size <= 10
    #       errors.add(:base, "Exceeds weekly limit")
    #   end
    # end

end
