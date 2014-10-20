Blocipedia::Application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :invoices, only: [:show, :index]

  devise_for :users
  root to: 'welcome#index'

end
