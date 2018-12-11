# frozen_string_literal: true

Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  resources :sessions, only: [:create, :new, :destroy]
  resources :posts
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
  root 'static#index'
  get 'static/index'
  get 'static/portfolio'
  get 'static/aboutme'
  get 'contact', to: 'messages#new'
  get 'messages/new'
  post 'messages/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
