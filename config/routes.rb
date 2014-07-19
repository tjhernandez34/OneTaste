Rails.application.routes.draw do
  root :to => 'restaurants#index'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'

  get '/logout' => 'sessions#destroy'

  resources :users

  resources :restaurants do
    resources :votes, :only => :create
    resources :images, :only => :create
  end

  resources :reviews do
    resources :votes, :only => :create
  end

  resources :friendships

  resources :comments do
    resources :votes, :only => :create
  end
  post '/comments' => 'comments#create', as: 'comment_create'
  post '/reviews' => 'reviews#create', as: 'review_create'

  delete '/reviews/:id(.:format)' => 'reviews#destroy', as: 'review_delete'
  delete '/comments/:id(.:format)' => 'comments#destroy', as: 'comment_delete'
  get '/search' => 'restaurants#search'

end
