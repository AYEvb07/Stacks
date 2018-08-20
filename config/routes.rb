Rails.application.routes.draw do
  
  root to: 'static#home'
  get 'team' => 'static#team'
  get 'home' => 'static#home'
  get 'new' => 'static#new'
  get 'login' => 'login#home'


  devise_for :users
  resources :users, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
