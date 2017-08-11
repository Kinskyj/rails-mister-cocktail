Rails.application.routes.draw do

  resources :doses, only: [:destroy]
  # delete "doses/:id", to: "doses#destroy"

  resources :cocktails, only: [:index, :show, :new, :create, :update] do
    resources :doses, only: [:create]
  end


  root 'cocktails#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
