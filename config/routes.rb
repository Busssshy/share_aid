Rails.application.routes.draw do

  namespace :volunteer do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :local_government do
    get 'homes/top'
  end
  # 自治体用
  devise_for :local_governments, controllers: {
    registrations: 'local_government/registrations',
    sessions: 'local_government/sessions'
  }

  # ボランティア用
  devise_for :volunteers, controllers: {
    registrations: 'volunteer/registrations',
    sessions: 'volunteer/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
