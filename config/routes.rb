Rails.application.routes.draw do
  # api/v1/challenges

  namespace :api do
    namespace :v1 do
      resources :challenges
    end
  end
end
