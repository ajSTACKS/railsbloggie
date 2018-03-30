Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  resources :blogs

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#about'


  root 'pages#home'

end
