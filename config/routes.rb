MassiveApp::Application.routes.draw do

  resources :shares
  resources :bookmarks
  resources :accounts

  root :to => "bookmarks#index"
end
