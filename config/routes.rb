Rails.application.routes.draw do
 
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :books, :comics, :records, :wishlists do
      resources :loans, :comicloans, only: [:index, :new, :create, :destroy]
    end
  end
end
