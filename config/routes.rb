Rails.application.routes.draw do
  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/edit'

  get 'welcome/index'

  get 'welcome/about'

  devise_for :users
  root 'welcome#index'
end
