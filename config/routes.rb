Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "about", to: "static_pages#about"
    get "category", to: "static_pages#category"
    get "login", to: "sessions#new"
    post "login", to: "sessions#create"
    delete "logout", to: "sessions#destroy"

    resources :users, except: %i(index destroy)

    namespace :admin do
      root "/admin#index"
      concern :paginatable do
        get "(page/:page)", action: :index, on: :collection, as: ""
      end

      resources :users, concerns: :paginatable, only: %i(index destroy)
    end
  end
end
