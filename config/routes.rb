Rails.application.routes.draw do
  mount Dashing::Engine, at: Dashing.config.engine_path
  resources :posts do
    resources :comments
  end

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]



 root "posts#index"
end
