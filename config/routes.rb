ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'index'
  map.resources :pages
  map.slug '/:id', :controller => 'pages', :action => 'show'
end
