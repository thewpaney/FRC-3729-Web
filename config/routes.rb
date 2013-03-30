RjfrcWeb::Application.routes.draw do
  resources :issues
  resources :events
  resources :blog_posts
  resources :users
  resources :home
  resources :build
  resources :code
  
  #Team
  get '/team' => 'team#about-us'
  get '/team/about-us' => 'team#about-us'
  get '/team/about-first' => 'team#about-first'
  # get '/team/contact' => 'team#contact'
  #Community
  match '/community' => 'community#index'
  get '/community/sponsors' => 'community#sponsors'
  get '/community/contact' => 'community#contact'
  #Sliders
  match '/slider1' => 'slider1#index'
  match '/slider2' => 'slider2#index'
  # Users
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'users#login'
  post '/login' => 'users#login'
  get '/logout' => 'users#logout'
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  match '/users(/:id)' => 'users#show'
  # Blog
  match '/' => redirect("/home")  
  get '/blog' => 'blog_posts#index'
  get '/blog/new' => 'blog_posts#new'
  match '/blog(/:id)' => 'blog_posts#show'
  # Issues
  match '/issues(/:id)' => 'issues#show'
  # Calendar
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  match '/calendar' => 'calendar#index'
  # Build
  get '/build' => 'build#index'
  
  # Code
  get '/code' => 'code#index'
  # Admin
  get '/admin' => 'admin#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

