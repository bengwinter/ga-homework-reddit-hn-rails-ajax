WdiHackerNews::Application.routes.draw do

  root 'stories#index'
  
  post 'users' => 'users#create', as: 'users'
  get 'delete' => "users#destroy", as: "delete_user"
  get "log_out" => "sessions#destroy", as: "log_out"
  get "list_stories" => "stories#list_stories", as: "list_stories"
  resources :sessions
  
  resources :stories do
    resources :comments
  end

end
