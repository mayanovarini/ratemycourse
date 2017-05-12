Rails.application.routes.draw do
  devise_for :users
  resources :courses
  get 'pages/about'

  get 'pages/career'

  get 'pages/press'

  get 'pages/tos'

  get 'pages/content'

  get 'pages/privacy'

  get 'pages/contact'

  root 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
