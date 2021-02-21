Rails.application.routes.draw do

  resources :products
  # DONT'T DO THIS !!! This is only for the demo to work,
  # instead you should use only the line with "mount WashoutBuilder::Engine"
  # and changing the path
  root :to => WashoutBuilder::Engine if defined?(WashoutBuilder::Engine)

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  namespace :api do
    wash_out :rumbas
    wash_out :project_service
  end

  wash_out :product

  mount MyEngine::Engine => '/engine1'
  mount Namespace::MyEngine2::Engine => '/engine2'
  mount MyEngine3::Engine => "/engine3"

  match 'test_soap', to: 'application#test_soap', via: [:get]
end
