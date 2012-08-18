Hd::Application.routes.draw do

  resources :beacons
  resources :sessions
  match 'login', :to => 'sessions#new'
  match 'beacons/edit', :to => 'beacons#edit'
  root to: 'welcome#home'

end
