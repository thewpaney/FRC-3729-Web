RjfrcWeb::Application.routes.draw do
  resources :issues
  resources :events
  resources :blog_posts
  resources :users
  resources :home
  
  #Team
  get '/team' => 'team#about-us'
  get '/team/about-us' => 'team#about-us'
  get '/team/about-first' => 'team#about-first'
  # get '/team/contact' => 'team#contact'
  #Community
  get '/community' => 'community#outreach'
  get '/community/outreach' => 'community#outreach'
  get '/community/events' => 'community#events'
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
  get '/build' => 'build#about'
  get '/build/about' => 'build#about'
  get '/build/garage' => 'build#2013'
  get '/build/garage/2013' => 'build#2013'
  get '/build/garage/2012' => 'build#2012'
  get '/build/garage/2011' => 'build#2011'
  # Code
  get '/code' => 'code#git'
  get '/code/projects' => 'code#projects'
  get '/code/git' => 'code#git'
  # Admin
  get '/admin' => 'admin#index'
  post '/events(/:id)' => 'events#update_attendance'
  # E-Mail
  post '/events/rsvp' => 'events#rsvp'
end

