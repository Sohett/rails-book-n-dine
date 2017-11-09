Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :registrations, :controllers => { registrations: "registrations"}
  root to: 'restaurants#index'

  resources :users, only: [:show, :edit, :update]
  resources :restaurants do
  resources :bookings, except: [:edit, :update]
  end
  get 'restaurants/search/:q', to:'restaurants#search', as: :search
end


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
