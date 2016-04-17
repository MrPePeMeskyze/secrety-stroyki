class CreateObjectTypes < ActiveRecord::Migration
  def change
    create_table :object_types do |t|
      t.string :name
      t.integer :sort_order, :default => 1
      
      t.timestamps
    end
    add_index :object_type, :name
  end
end
