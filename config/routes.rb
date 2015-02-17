Rails.application.routes.draw do
  get 'tasks/create'

  devise_for :users
  
  resources :users, only: [:show, :update]
  
  resources :lists, except: [:index] do
    resources :tasks, only: [:create, :destroy], shallow: true
  end

  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end