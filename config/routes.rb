Rails.application.routes.draw do
	# admin area
	get "/admin/" => "admin/objects#index"

	match "/admin/logon/", to: 'admin/sessions#logon', via: [:get, :post]

	match "/admin/logout/", to: 'admin/sessions#logout', via: [:get, :post]

	namespace :admin do
		resources :objects
	end
	namespace :admin do
		resources :objects_types
	end
	namespace :admin do
		resources :navigations
	end
	namespace :admin do
		resources :sessions
	end
	namespace :admin do
		resources :users
	end

	## Выборка пермалинков для статических страниц
	@__static = Objects.where("objects_type_id = ?", ENV['STATIC_PAGES_ID'])
    @__static = (@__static.map do |_static| "#{_static.permalink}" end).join('|')
    	
	root :to => "pages#index"

	match ':id', via: :get, :controller => 'catalog', :action => 'index',  :constraints => {:id => /catalog/}
	## Роутинг по статическим страницам
		## TODO: если в статической странице вложен раздел с другим типов, переадресует на pages, не должен учитывать такое 
	match ':id', via: :get, :controller => 'pages', :action => 'pages',  :constraints => {:id => /.*(#{@__static})/}

	match ":id", via: :get, :controller => 'catalog', :action => 'catalog_pages',:constraints => {:id => /catalog\/.*\/.*/}

	match ":id", via: :get, :controller => 'catalog', :action => 'category',:constraints => {:id => /catalog\/.*/}

	get ':controller(/:action(/:id))'

	get '*not_found', to: 'application#not_found'
end
