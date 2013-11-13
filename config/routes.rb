# config/routes.rb

MissionControl::Application.routes.draw do
  # See how all your routes lay out with "rake routes", or dump your routes to
  # ./routes.txt with "rake routes:print".

  devise_for :users

  resources :missions, :only => %i(index create)

  # Creates the user_root_path helper for Devise.
  get 'missions' => 'missions#index', :as => :user_root

  root :to => 'home#index'

  # Enable in-browser JS unit tests using Jasmine.
  mount JasmineRails::Engine => "/jasmine" if defined?(JasmineRails)
end # draw routes
