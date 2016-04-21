class CreateAdminUserRecords < ActiveRecord::Migration
  def change
  	Users.create(login: "admin", email: "predatorqwerty2@gmail.com", password: "4815162342", is_admin: 1, is_published: 1, name: "Сергей", last_name: "Антипов", middle_name: "Владимирович")
  end
end
