ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'show', :id => 'home'
  map.resources :pages
  map.resources :settings, :only => [:update]
  map.resources :uploads, :only => [:new, :create, :destroy]
  map.admin '/admin', :controller => 'pages', :action => 'index'
  map.slug '/:id', :controller => 'pages', :action => 'show' # last route
end