Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'post_images/new'
  get 'post_images/index'
  get 'post_images/show'
  patch 'users/:id' => 'users#update', as: 'update_user'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  get '/homes/about', to: 'homes#about', as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
