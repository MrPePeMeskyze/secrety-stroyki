class CreateObjectsTypesRecords < ActiveRecord::Migration
  def change
  	ObjectsTypes.create(name: "Новости", sort_order: "6")
  	ObjectsTypes.create(name: "Статьи", sort_order: "7")
  	ObjectsTypes.create(name: "Статическая страница", sort_order: "4")
  	ObjectsTypes.create(name: "Каталог", sort_order: "5")
  	ObjectsTypes.create(name: "Категория", sort_order: "3")
  	ObjectsTypes.create(name: "Группа", sort_order: "2")
  	ObjectsTypes.create(name: "Тип", sort_order: "1")
  end
end
