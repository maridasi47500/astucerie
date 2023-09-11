Rails.application.routes.draw do
  root 'welcome#index'
  get "astuces/:name", to: "cats#show", as: :mycat
  resources :cats
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
