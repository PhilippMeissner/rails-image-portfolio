Rails.application.routes.draw do
  resources :projects

  get 'legal', to: 'static#legal', as: 'legal'
  get 'contact', to:'static#contact', as: 'contact'
  post 'message_validation', to: 'static#validate_message', as: 'message_validation'

  root 'projects#index'
  match "*path" => "projects#index", via: [:get, :post]
end
