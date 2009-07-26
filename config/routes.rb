ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'index'
  map.resources :pages
  map.resources :settings, :except => :show
  map.slug '/:id', :controller => 'pages', :action => 'show'
end
