FurnitureStore::Application.routes.draw do
  root to: "homes#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { :sessions => "sessions" }

  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_out", :to => "devise/sessions#destroy"
  end

  resources :homes, only: :index do
  	collection do
  		get :all_furniture
  	end
  end

  resources :homes, only: :index
  resources :categories, only: [:index, :show]
  resources :rooms, only: [:index, :show]
end
