Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root to: "main#index"

  resources :discussions do
    resources :posts, only: [:show, :create, :edit, :update, :destroy], module: :discussions

    collection do
      get "category/:id", to: "categories/discussions#index", as: :category
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
