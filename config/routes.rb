Rails.application.routes.draw do
  Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/unicorns', to: "unicorns#index"
  get '/unicorns/new', to: 'unicorns#new', as: :new_unicorn
  post '/unicorns', to: 'unicorns#create'
  get '/unicorns/:id', to: 'unicorns#show', as: :unicorn_show
  get '/unicorns/:id', to: "booking#new", as: :new_booking
end
