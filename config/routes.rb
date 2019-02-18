Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :experiences do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :index] do
    resources :reviews, only: [:new, :create, :edit]
  end
end
