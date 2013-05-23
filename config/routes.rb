BooksShare::Application.routes.draw do
  resources :resources

  resources :books do
    collection do
      post 'auto_create' => 'books#auto_create'
      get 'auto_new'
    end
  end

  get "home/index"
  get "home/tag_cloud", as: :tag_cloud

  get 'tags/:tag', to: 'books#index', as: :tag
  get 'authors/:author', to: 'books#index', as: :author
  get 'translators/:translator', to: 'books#index', as: :translator

  match "/search" => "search#index", :as => :search
  delete 'likes/:resource_name/:resource_id' => "likes#destroy", :as => 'like'
  post 'likes/:resource_name/:resource_id' => "likes#create",  :as => 'like'

  devise_for :users

  authenticated :user do
    root to: "home#index"
  end

  as :user do
    root :to => 'books#index'
    get 'account' => 'registrations#edit', :as => 'account'
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
