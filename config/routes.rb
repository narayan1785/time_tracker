Rails.application.routes.draw do

  resources :time_trackers do 
    resources :event_logs, only: [:index]
  end
  

  devise_for :users

  match '/sign_out', to: 'sessions#destroy', via: :delete
  root 'home#index'

  resources :home , only: [:index] do 
    collection do
      post 'clock_in'
      post 'clock_out'
    end
  end

  # #resources :trackers, only: [:index, :edit] do 

  # end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
