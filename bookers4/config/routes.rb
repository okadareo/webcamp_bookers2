Rails.application.routes.draw do
  root :to => 'home#top'
  get 'home/about'
  devise_for :users
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  get "users/:id" => "users#show", as: :mypage
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
