Rails.application.routes.draw do

  get :feed, to: "posts#index"
  resources :pages do
    resources :posts, except: :index
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
