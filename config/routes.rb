Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show, :update]
  
  resources :lists, except: [:index]
  
  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end