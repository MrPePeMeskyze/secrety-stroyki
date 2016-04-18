class CreateObjectsNavigations < ActiveRecord::Migration
  def up
    create_table :navigations do |t|
      t.string :name, index: true
      t.string :description, index: true
      t.integer :sort_order, :default => 1
      
      t.timestamps
    end
    create_table :objects_navigations do |t|
      t.belongs_to :objects, index: true
      t.belongs_to :navigations, index: true
    end
  end
end
