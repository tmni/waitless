Rails.application.routes.draw do
  get 'home', to: 'home#index', as: :home
  root 'home#index'
end
