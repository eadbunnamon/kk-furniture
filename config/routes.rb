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
      get :map
  	end
  end

  resources :homes, only: [:index, :show] do
    collection do
      get :newest_products
      get :best_sellers
      get :promotions
      get :favorite
    end
  end

  resources :products, only: [:show] do
    collection do
      get :search
    end
  end
  
  resources :categories, only: [:index, :show]
  resources :rooms, only: [:index, :show]
  resources :categories, only: [:show]
  resources :rooms, only: [:show]
  resources :faqs, only: [:index]
  resources :sitemaps, only: [:index]
end
