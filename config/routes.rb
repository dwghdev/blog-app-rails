Rails.application.routes.draw do
  resources :posts
  get "home", to: "pages#home"
  get "pages/about", as: "about"

  root "pages#home"
end
