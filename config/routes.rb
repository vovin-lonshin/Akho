Akho::Application.routes.draw do
   
  get "daemons/new"
  get "designers/new"
  root  'static_pages#home'
  
  
    match '/home', to: 'static_pages#home', via: 'get'
    match '/help',    to: 'static_pages#help',    via: 'get'
    match '/about',   to: 'static_pages#about',   via: 'get'
    match '/contact', to: 'static_pages#contact', via: 'get'
    match '/signup', to: 'designers#new', via: 'get'
 
  
end