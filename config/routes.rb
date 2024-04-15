Rails.application.routes.draw do

   # 自治体用
  devise_for :local_governments, controllers: {
    registrations: 'local_government/registrations',
    sessions: 'local_government/sessions'
  }

  namespace :local_government do
    root to: "stocks#index"
    resources :genres, only: [:new, :create, :index, :destroy]
    resources :stocks, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  # ボランティア用
  devise_for :volunteers, controllers: {
    registrations: 'volunteer/registrations',
    sessions: 'volunteer/sessions'
  }

  namespace :volunteer do
    root to: "homes#top"
    get 'homes/about', as: 'about'
    resources :users, only: [:show]
    resources :local_governments, only: [:index, :show]
    resources :reserves, only: [:create, :index]
      post "reserves/comfirm" => "reserves#confirm"
      get  "reserves/thanks"  => "reserves#thanks"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end