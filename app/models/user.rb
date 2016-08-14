class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :rooms
	has_many :bookings
  has_many :been_heres
	
	belongs_to :user_role

     def is_admin?
     	return true if self.role == "admin"
     end

end
