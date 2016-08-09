Rails.application.routes.draw do
  resources :topics
  get 'about' => 'welcome#about'

  resources :title, only: [:edit, :destroy]
  devise_for :users
  root 'topics#index'
end
