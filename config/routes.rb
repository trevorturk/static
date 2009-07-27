ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'home'
  map.resources :pages, :except => [:index]
  map.resources :settings, :except => [:index, :show]
  map.resources :uploads, :only => [:new, :create, :destroy]
  map.admin '/admin', :controller => 'admin', :action => 'index'
  map.slug '/:id', :controller => 'pages', :action => 'show'
end
