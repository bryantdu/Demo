Demo::Application.routes.draw do
  
  resources :users
  
  match '/signup', to: 'user#new'
  
  root :to => "home#index"
end
