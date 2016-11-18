Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :disasters do
    resources :comments, :controller => "disaster_comments"
  end

  root :to => "disasters#index"
end
