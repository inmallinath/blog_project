Rails.application.routes.draw do


  root 'home#index'

  get "/about" => "home#about"

  get "/home" => "home#index"

  get "/posts/search" => "posts#search", as: :search_posts

  # TO CREATE A NEW POST
  get "/posts/new" => "posts#new", as: :new_posts
  post "/posts" => "posts#create", as: :posts

  # TO LIST ALL POSTS
  get "/posts/:id" => "posts#show", as: :post
  get "/posts" => "posts#index"

  # TO LIST ONLY LOGGED IN USER's POSTS
  get "/posts/:id/user" => "posts#index_user", as: :post_user

  # TO EDIT or UPDATE A POST
  get "/posts/:id/edit" => "posts#edit", as: :edit_post
  patch "/posts/:id" => "posts#update"
  delete "/posts/:id" => "posts#destroy"

  # TO CREATE A NEW COMMENT
  get "/comments/new" => "comments#new", as: :new_comments
  post "/comments" => "comments#create", as: :comments

  # TO LIST ALL COMMENTS
  get "/comments/:id" => "comments#show", as: :comment
  get "/comments" => "comments#index"

  # TO EDIT OR UPDATE A COMMENT
  get "/comments/:id/edit" => "comments#edit", as: :edit_comment
  patch "/comments/:id" => "comments#update"
  delete "/comments/:id" => "comments#destroy"

  resources :posts do
    resources :comments, only: [:create, :destroy, :index]
    resources :favorites, only: [:create, :destroy]
  end

  # RESOUCE for users controller actions with routes for updating password
  resources :users, only: [:new, :create, :show, :edit, :update] do
    member do
      get :edit_password, to: "users#edit_password"
      patch :edit_password, to: "users#update_password"
    end
  end

  # RESOURCE FOR GENERATING APIs for external apps
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :posts, only: [:index, :show, :create]
    end
  end

  resources :favorites, only: [:index]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :password_resets
end
