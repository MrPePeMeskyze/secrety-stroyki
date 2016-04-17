class AddIndexToObject < ActiveRecord::Migration
  def change
    add_index :objects, :permalink
    add_index :objects, :title
    add_index :objects, :header
  end
end