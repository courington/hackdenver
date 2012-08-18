Hd::Application.routes.draw do

  resources :beacons

  root to: 'welcome#home'
end
