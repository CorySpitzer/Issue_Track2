Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, 
  # see https://guides.rubyonrails.org/routing.html
  root to: "abouts#index"
  get "/issues", to: "issues#index"
  get "/issues/:id", to: "issues#show" #:id gets put in the params hash
  get "/projects", to: "projects#index"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show" 
  get "/about", to: "abouts#index"
  # get "/about", to: redirect("/about.html.erb")
  
  resources :projects, :issues
  # "creates seven different routes in your application"
  # https://guides.rubyonrails.org/routing.html
end
