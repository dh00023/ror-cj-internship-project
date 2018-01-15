Rails.application.routes.draw do
  resources :weathers, only: [:edit, :update]

  resources :categories do
	  resources :banners, only: [:index]
  end

  resources :banners, except: [:index] do
  	resources :recommends, only: [:index]
  end
  resources :recommends, except: [:show, :index]
  
  devise_for :users
  
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
