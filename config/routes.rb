Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'gps', to: 'positions#create'
    end
  end

  get '/show', to: 'dashboard#index'
end
