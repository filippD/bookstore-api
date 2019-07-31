class User < ApplicationRecord
	has_secure_password
	validates_presence_of :email, :username
	has_many :books
end
