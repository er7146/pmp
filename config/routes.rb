Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  
  post "/" => "users#index_post"
  
  resources "orders", path: "/orders", controller: "orders",
    only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # The above resources lines expand to:
  #   get    "/orders"           => "orders#index"
  #   get    "/orders/:id/show"  => "orders#show"
  #   get    "/orders/new"       => "orders#new"
  #   post   "/orders"           => "orders#create"
  #   get    "/orders/:id/edit"  => "orders#edit"
  #   put    "/orders/:id"       => "orders#update"
  #   delete "/orders/:id"       => "orders#destroy"
end
