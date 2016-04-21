class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :login, index: true
      t.string :email, index: true
      t.string :password
      t.boolean :is_admin 
      t.boolean :is_published
      t.string :name
      t.string :last_name
      t.string :middle_name

      t.timestamps
    end
  end
end
