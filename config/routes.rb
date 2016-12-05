Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  #get '/login' => 'users#sign_in'

  devise_scope :user do
	get '/login', to: 'devise/sessions#new', as: :login 
	get '/logout', to: 'users#logout'
  end

  get '/new_patients', to: 'generator#patients'

  get '/create_patient/:gender/:dob', to: 'generator#create_patient'

  get 'generator/test'

  get '/new_visits', to: 'generator#visits'

  get '/list_of_patients_without_any_encounters', to: 'generator#list_of_patients_without_any_encounters'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
