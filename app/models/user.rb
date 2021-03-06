class User < ActiveRecord::Base
	attr_accessible :email, :password_digest, :first_name, :last_name
	has_secure_password
	validates :email, :password, :presence => true
	validates :email, :uniqueness => true
	attr_accessible :email, :password, :password_confirmation
	has_many :images
end
