Rails.application.routes.draw do
  resources :lists

  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
end
