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

	## Выборка пермалинков для статических страниц
	@__static = Objects.where("objects_type_id = ?", ENV['STATIC_PAGES_ID'])
    @__static = (@__static.map do |_static| "#{_static.permalink}" end).join('|')

	root :to => "pages#index"
	get "/catalog/" => "catalog#index"

	## Роутинг по статическим страницам
	match ':id', via: :get, :controller => 'pages', :action => 'pages',  :constraints => {:id => /.*(#{@__static}).*/}
	
	get ':controller(/:action(/:id))'

	get '*not_found', to: 'application#not_found'
end
