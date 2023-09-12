Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations",sessions: 'users/sessions' }
  resources :myfavs, path: "myfavoritetips", as: :myfavoritetips
  resources :comments
  resources :notes
  resources :tips
  root 'welcome#index'
  get "astuces/:name", to: "cats#show", as: :mycat
  get "mes-favoris", to: "cats#myfav", as: :myfav
  resources :cats
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
