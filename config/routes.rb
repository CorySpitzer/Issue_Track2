Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, 
  # see https://guides.rubyonrails.org/routing.html
  get "/issues", to: "issues#index"
  get "/issues/:id", to: "issues#show" #:id gets put in the params hash
  get "/projects", to: "projects#index"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show" 
  # This might be overkill for about, but it works
  get "/about", to: "abouts#index"
  # get "/about", to: redirect("/about.html.erb")
  
  resources :projects, :issues
  # "creates seven different routes in your application"
  # https://guides.rubyonrails.org/routing.html

  # From https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
end
