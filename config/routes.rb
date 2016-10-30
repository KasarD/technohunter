Rails.application.routes.draw do

  root 'vehicles#index'

  resources :cars, :trucks, :equips


end
