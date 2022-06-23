Rails.application.routes.draw do
  get "home", to: "pages#home"
  get "pages/about", as: "about"

  root "pages#home"
end
