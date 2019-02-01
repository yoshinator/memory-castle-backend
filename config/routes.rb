Rails.application.routes.draw do

  namespace 'memorycastleapi', path: '/' do
    namespace :api do
      namespace :v1 do
        resources :users
        resources :castles
        resources :memories
    end
  end
end
  
end
