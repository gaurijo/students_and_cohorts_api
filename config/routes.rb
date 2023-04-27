Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/cohorts/:id/students', to: 'students#index'
    end
  end
end
