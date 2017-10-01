Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :organisations
  resources :parameters

  resources :test_statuses
  resources :test_types
  resources :test_type_versions

  resources :specimen_group_relationships
  resources :specimen_groups

  resources :specimen_types
  resources :specimen_type_versions

  resources :sample_types
  resources :sample_type_versions

  resources :work_order_statuses
  resources :work_orders do
    resources :samples
    resources :specimens
    resources :lab_tests
  end

  resources :samples
  resources :specimens
  resources :lab_tests

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    # Root
    get 'home/index', to: 'home#index'
    get '/home', to: 'home#index'
    get '/', to: 'home#index'
    # root 'home#index'

    # Resources

  end
end
