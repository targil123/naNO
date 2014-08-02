class User < ActiveRecord::Base
	validates :email,presence: true,uniqueness: true
	has_secure_password
	def self.digest token
		Digest::SHA1.hexdigest(token.to_s)
	end
end
