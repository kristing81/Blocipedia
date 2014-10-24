Blocipedia::Application.routes.draw do

  resources :invoices, only: [:index]

  resources :wikis do
    resources :collaborators
    end

  resources :charges, only: [:new, :create, :index]
  

  devise_for :users
  root to: 'welcome#index'

end
