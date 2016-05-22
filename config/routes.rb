Rails.application.routes.draw do
  jsonapi_resources :movies do
    jsonapi_resources :reviews
  end
end
