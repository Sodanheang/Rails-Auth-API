Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :problems 
      resources :services 

      devise_for :users, only: []

      devise_scope :user do
      end

      post "/sign_in" => 'sessions#create'
      post "/sign_up", to: 'registrations#create'
      delete "/sign_out" => 'sessions#destroy'

    end
  end
end
