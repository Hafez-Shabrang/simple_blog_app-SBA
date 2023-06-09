Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  resources :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  get "login", to: "session#new"
  post "login", to: "session#create"
  get "logout", to: "session#destroy"
end
