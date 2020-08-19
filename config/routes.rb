Rails.application.routes.draw do
  Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
  root to: 'pages#home'

  resources :bookinks, only: [:index, :show, :destroy]
  resources :unicorns do
    resources :bookings, only: [:new, :create]
  end
end
