Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]



 root "posts#index"
end
