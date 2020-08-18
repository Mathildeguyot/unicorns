Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/unicorns/:id', to: 'unicorns#show', as: :unicorn
  get '/unicorns/:id', to: "booking#new", as: :new_booking
  resources :unicorns, only: [:new, :create]
end
