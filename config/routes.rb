Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users, only: [:new, :create, :show]



 root "posts#index"
end
