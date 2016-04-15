class Objects < ActiveRecord::Base
	validates :header, presence: true, uniqueness: true
	validates :title, presence: true, uniqueness: true
	validates :permalink, presence: true, uniqueness: true
	def to_param
		full_path
	end

	belongs_to :parent, 
		class_name: "Objects", 
		foreign_key: "parent_id"

	has_many :childs,
		class_name: "Objects", 
		foreign_key: "parent_id"

	before_save :before_save
	after_create :after_create

	private
		def before_save
			if(self.parent_id != self.parent_id_was)
				if(self.parent_id?)
					self.thread_id = self.parent.thread_id
					self.nesting = self.parent.nesting+1
				else
					self.thread_id = self.id
					self.nesting = 0
				end
			end

			if(self.permalink? && self.parent_id?)
				self.full_path = self.parent.full_path+"/"+self.permalink
			else
				self.full_path = "/"+self.permalink
			end
		end
		def after_create
			if(self.parent_id == 0)
				reload
	  			update_attribute(:thread_id, self.id)
	  		end
		end
end
