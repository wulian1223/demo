class User < ActiveRecord::Base
 # 	validates :name,:password, :presence => true
	# validates :name, :length => {:minimum =>2}
	has_many :posts, dependent: :destroy
	before_save {self.email = email.downcase}
	before_create :create_remember

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def feed
		Posts.where("user_id =?",id)
	end

	private
	def create_remember
		puts "cteate!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end


