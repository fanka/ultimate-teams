Rails.application.routes.draw do
  get 'pages/home'

  devise_for :admins
  devise_for :users

  resources :pairs
  resources :profiles


  post 'rotate_and_generate_new' => 'pairs#rotate_and_generate_new', as: :rotate_and_generate_new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
