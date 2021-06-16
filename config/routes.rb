Rails.application.routes.draw do
  get 'all_projects/index'
  #  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, 
  # see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/issues", to: "issues#index"
  get "/issues/:id", to: "issues#show" #:id gets put in the params hash
  # get "/projects", to: "projects#index"
  resources :projects
  # get "projects/report", to: "projects#report"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show" 
  get "/about", to: "abouts#index"
  # get "/about", to: redirect("/about.html.erb")
  get "/comments", to: "comments#index"
  get "/comments/:id", to: "comments#show"
  get "/project_reports", to: "project_reports#index"
  
  
  resources :projects, :issues
  # "creates seven different routes in your application"
  # https://guides.rubyonrails.org/routing.html
end
