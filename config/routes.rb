Rails.application.routes.draw do

  get 'author/show'
  devise_for :users, controllers: { registrations: "users/registrations",sessions: 'users/sessions' }
  #get "author/:username", to: "author#show"
  resources :myfavs, path: "myfavoritetips", as: :myfavoritetips do
    collection do
      post "deletefav"
    end
  end
  resources :comments
  resources :notes do
    collection do
      post "mynote"
    end
  end
  resources :tips
  root 'welcome#index'
  get "astuces/:name", to: "cats#show", as: :mycat
  get "mes-favoris", to: "cats#myfav", as: :myfav
  resources :cats
  get ":title", to: "tips#show", as: :mytip
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
