Rails.application.routes.draw do
  devise_for :students, controllers: {
    sessions: 'students/sessions',
    registrations: 'students/registrations'
  }
  devise_scope :students do
    get "sign_in", :to => "students/sessions#new"
    get "sign_out", :to => "students/sessions#destroy" 
    get "sign_up", :to => "students/registrations#new"
  end

  devise_for :teachers, controllers: {
    sessions: 'teachers/sessions',
    registrations: 'teachers/registrations'
  }
  devise_scope :teachers do
    get "sign_in", :to => "teachers/sessions#new"
    get "sign_out", :to => "teachers/sessions#destroy"
    get "sign_up", :to => "teachers/registrations#new"
  end

  root to: "tops#index"
  resources :tops, only: [:index]
  resources :tweets, only: [:index]
end
