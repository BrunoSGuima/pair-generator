Rails.application.routes.draw do
root 'pairings#index'

resources :pairings, only: [:index, :create]

resources :participants, only: [:create]

end
