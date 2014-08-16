class User < ActiveRecord::Base
	validates :email,presence: true,uniqueness: true
	has_secure_password
	def self.digest token
		Digest::SHA1.hexdigest(token.to_s)
	end
	def self.new_remember_token
		SecureRandom.urlsafe_base64	
	end
	has_many :posts
end
