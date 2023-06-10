Rails.application.routes.draw do
  root 'pairings#index'

  resources :pairings, only: [:index, :create]

  resources :participants, only: [:create]

  post 'pairings/manual', to: 'pairings#add_manual_pair', as: 'manual_pairs'
end

