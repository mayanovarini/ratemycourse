Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    collection do
      get 'search'
    end
    resources :reviews, except: [:show, :index]
  end

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
