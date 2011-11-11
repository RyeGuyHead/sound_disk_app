SampleApp::Application.routes.draw do
    
    resources :users do
        member do
            get :following, :followers
        end
    end
    
  get "sessions/new"

    resources :users
    resources :sessions,   :only => [:new, :create, :destroy]
    resources :microposts, :only => [:create, :destroy]
    resources :relationships, :only => [:create, :destroy]
    resources :songs

    match '/users/:id/songs', :to => 'songs#user_songs'
    match '/create', :to => 'songs#create'

    match '/signup',  :to => 'users#new'
    match '/signin',  :to => 'sessions#new'
    match '/signout', :to => 'sessions#destroy'

    match '/contact', :to => 'pages#contact'
    match '/about',   :to => 'pages#about'
    match '/help',    :to => 'pages#help'
    
    match '/users/:id/microposts',   :to => 'microposts#index'

    root :to => 'pages#home'
end
