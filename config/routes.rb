# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  # devise_for :users
  # devise_for :mentors
  # devise_for :mentees

# devise_scope :user do
#   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
#   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end
  # devise_scope :mentee do
  #   get "/mentees/auth/github/callback" => "callbacks#github"
  # end

  get 'juniors', to: 'developers#index'
  get 'projects', to: 'projects#index'

  resources :projects

  authenticated :user do
    root 'projects#index'
  end

  root 'welcome#index'
end
