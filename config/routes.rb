Rails.application.routes.draw do
  devise_for :registrations
  root to: 'restaurants#index'

  resources :users, only: [:show, :edit, :update]
  resources :restaurants do
    resources :bookings, except: [:edit, :update]
  end
end






# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
