ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'root'
  map.slug '/:slug', :controller => 'pages', :action => 'show'
end
