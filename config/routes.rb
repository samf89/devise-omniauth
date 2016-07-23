Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :products

  root 'pages#index'
  get '/secret', to: 'pages#secret'

end
