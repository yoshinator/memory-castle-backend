Rails.application.routes.draw do

  scope path: 'memorycastleapi' do
    namespace :api do
      namespace :v1 do
        resources :users
        resources :castles
        resources :memories
      end
    end
  end
  
end
