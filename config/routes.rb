Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :bookings, only: [:index, :show, :destroy]
  resources :unicorns do
    resources :bookings, only: [:new, :create]
  end
end
