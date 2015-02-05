Rails.application.routes.draw do
  resources :lists
  
  devise_for :users
  resources :users, only: [:show, :update]
  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end
  
  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
end
