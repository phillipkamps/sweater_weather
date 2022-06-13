Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/api/v1/forecast", to: "api/v1/forecast#landing"

  get "api/v1/backgrounds", to: "api/v1/backgrounds#landing"

  post "api/v1/users", to: "api/v1/users#create"

  get "api/v1/book-search", to: "api/v1/books#search"
end
