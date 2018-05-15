Rails.application.routes.draw do
  resources :pools do
    resources :bookings, except: [:edit, :update, :show, :new]
end
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

