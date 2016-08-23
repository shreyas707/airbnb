class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of   :first_name, :last_name, :mobile_number
  validates_uniqueness_of :mobile_number, allow_blank: false

	has_many :rooms
	has_many :bookings
  has_many :been_heres
  has_many :notifications
	
	belongs_to :user_role

     def is_admin?
     	return true if self.role == "admin"
     end

end
