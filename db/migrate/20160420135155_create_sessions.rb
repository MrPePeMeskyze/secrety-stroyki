class CreateSessions < ActiveRecord::Migration
  def up
    create_table :sessions do |t|
      t.integer :user_id, :default => 0
      t.string :sid, index: true
      t.datetime :dt_access
    end
  end
end
