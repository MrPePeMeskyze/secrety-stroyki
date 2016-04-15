class Objects < ActiveRecord::Base
	validates :header, presence: true, uniqueness: true
	validates :title, presence: true, uniqueness: true
	validates :permalink, presence: true, uniqueness: true
	def to_param
		permalink
	end
end
