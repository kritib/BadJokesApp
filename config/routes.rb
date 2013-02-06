BadJokesApp::Application.routes.draw do

  root to: 'jokes#index'
  resources :jokes
  resources :sessions
  resources :votes

  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete

end