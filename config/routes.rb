Rails.application.routes.draw do
  resources :topics
  get 'about' => 'welcome#about'

  devise_for :users
  root 'welcome#index'
end
