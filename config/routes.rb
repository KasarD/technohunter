Rails.application.routes.draw do

  root 'vehicles#index'

  get ':type/update_models' => 'vehicles#update_models'
  get ':type/update_cities' => 'vehicles#update_cities'
  get ':type/:id/update_cities' => 'vehicles#update_cities'
  get ':type/:id/update_models' => 'vehicles#update_models'

  resources :cars, :trucks, :equips
  resources :vehicles

  

end
