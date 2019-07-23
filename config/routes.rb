Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "about", to: "static_pages#about"
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"
    get "signup", to: "users#new"
    post "signup", to: "users#create"

    resources :users, only: %i(show edit create update)
    resources :categories, only: %i(index show)

    namespace :admin do
      root "/admin#index"
      concern :paginatable do
        get "(page/:page)", action: :index, on: :collection, as: ""
      end

      resources :comics, only: %i(index show new create) do
        resources :chapters, only: %i(index show new create)
      end
      resources :users, concerns: :paginatable, only: %i(index destroy)
      resources :comics, only: %i(show new create)
      resources :categories
    end
  end
end
