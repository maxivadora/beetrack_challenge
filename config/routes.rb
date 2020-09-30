Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :positions, only: %i[create]
    end
  end
end
