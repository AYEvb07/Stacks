Rails.application.routes.draw do
  
  root to: 'static#home'  
    
  resources :dashboards
  get 'dashboard/user_dashboard'
  get 'index' => 'dashboards#index'

  root to: 'static#home'
  get 'team' => 'static#team'
#   get 'home' => 'static#home'
  get 'new' => 'static#new'
  get 'login' => 'login#home'
  get 'dashboards' => 'static#dashboards'


  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
