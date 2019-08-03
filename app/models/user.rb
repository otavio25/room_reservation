class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :validatable
	
	has_one :user_profile
	accepts_nested_attributes_for :user_profile, reject_if: :all_blank
	
	#Validations
	validates :name, presence: true, length: {minimum:3}, on: :update or :create
	
	#kaminari paginação
	paginates_per 10      
end
