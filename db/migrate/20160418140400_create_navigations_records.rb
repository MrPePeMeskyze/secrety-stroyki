class CreateNavigationsRecords < ActiveRecord::Migration
  def change
  	Navigations.create(name: "main_navigation", sort_order: "1", description: "Главная навигация")
  	Navigations.create(name: "sitemap", sort_order: "2", description: "Карта сайта")
  	Navigations.create(name: "catalog_navigation", sort_order: "1", description: "Навигация по каталогу")
  end
end
