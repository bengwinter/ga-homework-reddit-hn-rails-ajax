WdiHackerNews::Application.routes.draw do

  root 'stories#index'
  
  resources :users
  resources :sessions
  resources :stories do
    resources :comments
  end

end
