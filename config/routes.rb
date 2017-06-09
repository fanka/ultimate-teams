Rails.application.routes.draw do
  get 'pages/home'
  post '/admins.:id' => 'users#change_admin_status'
  post 'choose_date' => 'pairs#choose_date', as: :choose_date

  devise_for :admins
  devise_for :users

  resources :pairs
  resources :profiles
  resources :admins, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
