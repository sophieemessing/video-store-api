Rails.application.routes.draw do
  post 'rentals/check-in', to: "rentals#check_in", as: "rentals_check_in"
  post 'rentals/check-out', to: "rentals#check_out", as: "rentals_check_out"
  get 'rentals/overdue', to: "rentals#overdue"
  resources :videos, only: [:index, :show, :create]
  resources :customers, only: [:index, :show, :create]
end
