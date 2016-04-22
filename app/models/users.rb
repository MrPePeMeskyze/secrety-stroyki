class Users < ActiveRecord::Base

	validates :login, presence: true, length: { maximum: 50 }, uniqueness: true
	validates_confirmation_of :password
    validates_presence_of :password, :on => :create
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	has_many :sessions

	before_save :before_save
	def title
		title = (self.name+" "+self.last_name).strip
	end
	private
		def before_save
			self.email = self.email.downcase
			self.login = self.login.downcase

			if(self.password? && self.password != self.password_was)
				self.password = Digest::MD5.hexdigest(self.password)
			end
			if(self.password.blank?)
				self.password = self.password_was
			end
		end
end
