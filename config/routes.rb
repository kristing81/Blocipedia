Blocipedia::Application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create, :index]
  

  devise_for :users
  root to: 'welcome#index'

end
