Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts
    resources :comments
    
    end

  resources :posts do
  resources :comments
  end
  
  resources :tags
  resources :posts
  resources :comments
  # resources :posts do
  #   resources :posts_tags
  #   resources :tags
  # end
  # resources :posts_tags
  # resources :posts do
  #   resources :tags, :controller => 'PostsTag'
  # end
  # resources :users, param: :name
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'
  
end
