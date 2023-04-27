Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/students', to: 'students#index'
    end
  end
end
