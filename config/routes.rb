Rails.application.routes.draw do
  get 'teachers/show'
  get 'students/show'
  # devise_for :students
  # devise_for :teachers
  # devisecontrollerで記述している内容を有効にする。
  devise_for :students, controllers: {
    sessions: 'students/sessions',
    registrations: 'students/registrations'
  }
  # devise_scope :students do
  #   get "sign_in", :to => "students/sessions#new"
  #   get "sign_out", :to => "students/sessions#destroy" 
  #   get "sign_up", :to => "students/registrations#new"
  # end

  # devisecontrollerで記述している内容を有効にする。
  devise_for :teachers, controllers: {
    sessions: 'teachers/sessions',
    registrations: 'teachers/registrations'
  }
  # devise_scope :teachers do
  #   get "sign_in", :to => "teachers/sessions#new"
  #   get "sign_out", :to => "teachers/sessions#destroy"
  #   get "sign_up", :to => "teachers/registrations#new"
  # end

  resources :students, only: [:show] 
  resources :teachers, only: [:show]
  
  root to: "tops#index"
  resources :tops, only: [:index]
  resources :tweets, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :posts, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end

end
