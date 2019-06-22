# typed: strict


Rails.application.routes.draw do
  resources :projects
  root 'static#index'
  get 'login', to: 'sessions#new'
  get 'portfolio', to: 'projects#index'
  get 'posts/list'
  get 'sessions/new'
  get 'setup/ubuntu'
  get 'setup/zsh'
  get 'setup/ruby'
  get 'setup/vscode'
  get 'setup/gnome'
  get 'setup/albert'
  get 'setup/index'
  get 'setup/misc'
  get 'setup/issues'
  get 'static/index'
  get 'static/aboutme'
  get 'contact', to: 'messages#new'
  get 'messages/new'
  post 'messages/create'
  resources :tags
  resources :sessions, only: %i[create new destroy]
  resources :posts
  get '/check.txt', to: proc { [200, {}, ['it_works']] }
  get 'google5ef096ebdd0ff65a.html', to: 'static#google5ef096ebdd0ff65a', layout: false
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
