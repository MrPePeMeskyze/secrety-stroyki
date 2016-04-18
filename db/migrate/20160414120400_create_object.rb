class CreateObjects < ActiveRecord::Migration
  def change
    create_table :objects do |t|
      t.string :title
      t.string :header
      t.text :body
      t.text :additional_body
      t.boolean :is_published 
      t.string :permalink
      t.string :full_path
      t.string :image
      t.integer :parent_id, :default => 0
      t.integer :sort_order, :default => 1
      t.integer :thread_id, :default => 0
      t.integer :nesting, :default => 0
      t.integer :object_type_id, :default => 0
      t.integer :auser_id, :default => 0
      t.text :meta_keywords
      t.text :meta_description
      
      t.timestamps
    end
  end
end
