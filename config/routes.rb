Rails.application.routes.draw do
  devise_for :users 
  resources :posts do
    resources :comments
  end
  resources :users
  root 'posts#index'
  get '/users', to: 'users#index'
  get '/about' , to: 'pages#about'
end
