Rails.application.routes.draw do
  
  root to: 'static#home'
  get 'team' => 'static#team'


  devise_for :users
  resources :users, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
