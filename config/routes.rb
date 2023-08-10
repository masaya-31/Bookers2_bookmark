Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about", as: 'about'

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :update, :edit] do
    get 'bookmarks', to:'bookmarks#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
