Hd::Application.routes.draw do

  resources :beacons
  resources :sessions
  match 'login', :to => 'sessions#new'
  root to: 'welcome#home'

end
