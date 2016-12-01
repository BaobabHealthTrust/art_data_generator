Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  #get '/login' => 'users#sign_in'

  devise_scope :user do
	get '/login', to: 'devise/sessions#new', as: :login 
	get '/logout', to: 'users#logout'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
