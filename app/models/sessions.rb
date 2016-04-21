class Sessions < ActiveRecord::Base

	validates :sid, uniqueness: true

	belongs_to :user, class_name: "Users", foreign_key: "user_id"

	before_create :before_create

	private
		def before_create
			## генерация sid сессии ##
			self.sid = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)
		end

end
