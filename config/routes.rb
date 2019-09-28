# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :accounts do
    collection do
      get 'verify_account'
    end
  end
  resources :transactions do
    collection do
      get 'verify_transaction'
    end
  end
end
