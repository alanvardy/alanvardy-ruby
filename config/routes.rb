# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static#index'
  get 'static/index'
  get 'static/portfolio'
  get 'static/resume'
  get 'static/contact'
  get 'static/blog'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
