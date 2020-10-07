# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'company/create', action: :init_company, controller: 'onboarding'
  get 'groups', action: :index, controller: :group
  get 'group/:id', action: :show, controller: :group
  get 'users', action: :index, controller: :user
  get 'user/:id', action: :show, controller: :user
  post 'users/email', action: :send_email, controller: :user

  get 'probe', to: 'probe#probe'
end
