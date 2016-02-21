Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  get "/about" => "home#about"

  get "/home" => "home#index"

  # ADDED TODAY
  # TO SEARCH A POST BY EITHER A TITLE OR BODY
  get "/posts/search" => "posts#search", as: :search_posts
  # END OF CODE

  # TO CREATE A NEW POST
  get "/posts/new" => "posts#new", as: :new_posts
  post "/posts" => "posts#create", as: :posts

  # TO LIST ALL POSTS
  get "/posts/:id" => "posts#show", as: :post
  get "/posts" => "posts#index"

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


# ADDED TODAY
resources :posts do
  get :search, on: :collection
  patch :mark_done, on: :member
  post :approve

  # By defining `resources :answers` nested outside `resources :questions`
  # Rails will define all the answers routes prepended with
  # '/questions/:question_id'. This enables us to have the question_id handy
  # so we can create the answer associated with `question_id`
  resources :comments, only: [:create, :destroy]
end


# RESOUCE for users controller actions
resources :users, only: [:new, :create]
resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end
  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
