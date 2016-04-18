class Navigations < ActiveRecord::Base

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true, uniqueness: true

	has_and_belongs_to_many :objects, 
		join_table: "objects_navigations",
		class_name: "Objects"
end
