Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
 
  jsonapi_resources :users
  jsonapi_resources :activities
  jsonapi_resources :ratings
  jsonapi_resources :activity_users
  jsonapi_resources :messages
end
