Rails.application.routes.draw do
  post "users/login", to: "users#show"
  resources :todos
  resources :users
end
