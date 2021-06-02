Rails.application.routes.draw do
  # For details on the DSL available within this file, 
  # see https://guides.rubyonrails.org/routing.html
  get "/issues", to: "issues#index"
  get "/projects", to: "projects#index"
  
  resources :projects, :issues
  # "creates seven different routes in your application"
  # https://guides.rubyonrails.org/routing.html
end
