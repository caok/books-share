BooksShare::Application.routes.draw do
  resources :resources do
    put 'pdf2html', :on => :member
    get 'read', :on => :member
  end

  resources :books do
    collection do
      post 'auto_create' => 'books#auto_create'
      get 'auto_new'
    end
    member do
      post 'follow'
      post 'unfollow'
    end
  end

  get 'home/index'
  get 'home/tag_cloud', as: :tag_cloud

  get 'tags/:tag', to: 'books#index', as: :tag
  get 'authors/:author', to: 'books#index', as: :author
  get 'translators/:translator', to: 'books#index', as: :translator

  devise_for :users

  authenticated :user do
    root to: "home#index"
  end

  as :user do
    root :to => 'books#index'
    get 'account' => 'registrations#edit', :as => 'account'
  end

  # http://guides.rubyonrails.org/routing.html#specifying-constraints
  resources :users, :path => '', :only => [:show], constraints: { id: /[^\/]+/ }

  get "/auth/:provider/callback", :to => 'sessions#create'

end
