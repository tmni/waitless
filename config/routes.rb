Rails.application.routes.draw do
  get 'home', to: 'home#index', as: :home


  get 'home/history', to: 'home#history', as: :history
  get 'home/cart', to: 'home#cart', as: :cart
  get 'home/scan', to: 'home#scan', as: :scan
  root 'home#index'

end
