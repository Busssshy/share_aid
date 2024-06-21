Rails.application.routes.draw do

  root to: 'homes#top'

   # 自治体用
  devise_for :local_governments, controllers: {
    registrations: 'local_government/registrations',
    sessions: 'local_government/sessions'
  }

  namespace :local_government do
    root to: "stocks#index"
    resources :stocks, only: [:new, :create, :index, :edit, :update, :destroy]
  end

  # ボランティア用
  devise_for :volunteers, controllers: {
    registrations: 'volunteer/registrations',
    sessions: 'volunteer/sessions'
  }

  namespace :volunteer do
    root to: "local_governments#index"
    get 'homes/about', as: 'about'
    resources :volunteers, only: [:show, :edit, :update]
    resources :local_governments, only: [:index, :show]
    resources :reservation_confirmations, only: [:create]
    resources :reservations, only: [:create, :index ] do
      post "reservations/confirm" => "reservations#confirm"
      # get "reservations/thanks" => "reservations#thanks"
      get 'thanks', on: :collection
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end