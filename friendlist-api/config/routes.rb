Rails.application.routes.draw do
 
  jsonapi_resources :users
  jsonapi_resources :activities
  jsonapi_resources :ratings
end
