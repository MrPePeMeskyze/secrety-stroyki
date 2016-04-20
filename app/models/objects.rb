class Objects < ActiveRecord::Base
	require 'carrierwave/orm/activerecord'

	validates :header, presence: true, uniqueness: true
	validates :title, presence: true, uniqueness: true
	validates :permalink, uniqueness: true

	mount_uploader :image, ImageUploader
	
	belongs_to :parent, 
		class_name: "Objects", 
		foreign_key: "parent_id"

	has_many :childs, -> { order "nesting ASC" },
		class_name: "Objects", 
		foreign_key: "parent_id",
		dependent: :destroy

	has_and_belongs_to_many :navigations, 
		join_table: "objects_navigations",
		class_name: "Navigations"

	has_and_belongs_to_many :main_navigations, -> { where("name = ?", "main_navigation") },
		join_table: "objects_navigations",
		class_name: "Navigations"

	has_and_belongs_to_many :catalog_navigations, -> { where("name = ?", "catalog_navigations") },
		join_table: "objects_navigations",
		class_name: "Navigations"

	before_save :before_save
	after_create :after_create
	after_save :after_save

	private
		def before_save
			if(self.permalink? && self.parent_id?)
				## Генерируем full_path относительно родителя ##
				self.full_path = self.parent.full_path+"/"+self.permalink
			else
				## full_path для корня ##
				self.full_path = "/"+ self.permalink
			end
			## Если перемещаем к другому родителю ##
			if(self.parent_id != self.parent_id_was)
				if(self.parent_id?)
					self.thread_id = self.parent.thread_id
					self.nesting = self.parent.nesting+1
				else
					self.thread_id = self.id
					self.nesting = 0
				end
			end

#			## параметры публикации относительно родителя ##
#			if(self.parent_id?)
#				self.is_published = self.parent.is_published
#			end
		end
		def after_save
			## если изменился full_path или объект переместили ##
			if(self.is_published != self.is_published_was ||
				self.thread_id != self.thread_id_was || self.nesting != self.nesting_was || 
				self.full_path != self.full_path_was)
				## обновляем дочерние объекты (рекурсивно) ##
				self.childs.each do |object|
					## обновляем расположение ##
					object.thread_id = self.thread_id
					object.nesting = self.nesting + 1
					
					## если текущий объект скрыт, то и все дочерние ##
#					if(object.is_published = 0)
#						object.is_published = self.is_published	
#					end

					## обновляем full_path ##
					if(object.permalink?)
						object.full_path = object.parent.full_path+"/"+object.permalink
					end
					object.save
				end
			end
		end
		def after_create
			if(self.parent_id == 0)
				reload
	  			update_attribute(:thread_id, self.id)
	  		end
		end
end
