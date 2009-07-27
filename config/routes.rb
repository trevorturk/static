ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'pages', :action => 'home'
  map.resources :pages, :except => [:index, :edit]
  map.resources :themes, :only => [:edit, :update]
  map.resources :uploads, :only => [:new, :create, :destroy]
  map.admin '/admin', :controller => 'admin', :action => 'index'
  map.edit_page '/:id/edit', :controller => 'pages', :action => 'edit'
  map.edit_settings '/admin/settings', :controller => 'admin', :action => 'settings'
  map.slug '/:id', :controller => 'pages', :action => 'show'
end
