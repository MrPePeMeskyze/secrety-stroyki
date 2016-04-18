class CreateObjectsTypes < ActiveRecord::Migration
  def change
    create_table :objects_types do |t|
      t.string :name
      t.integer :sort_order, :default => 1
      
      t.timestamps
    end
    add_index :objects_types, :name
  end
end
