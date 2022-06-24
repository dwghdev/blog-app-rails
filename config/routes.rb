Rails.application.routes.draw do
  get "search", to: "search#index"
  get "about", to: "pages#about"

  get "users/profile"
  devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"
    }
  get "/u/:id", to: "users#profile", as: "user"

  resources :posts do
    resources :comments
  end

  root "pages#home"
end
