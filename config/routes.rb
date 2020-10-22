Rails.application.routes.draw do
  devise_for :students, controllers: {
    sessions: 'students/sessions'
  }
  devise_scope :students do
    get "sign_in", :to => "students/sessions#new"
    get "sign_out", :to => "students/sessions#destroy" 
  end

  devise_for :teachers, controllers: {
    sessions: 'teachers/sessions'
  }
  devise_scope :teachers do
    get "sign_in", :to => "teachers/sessions#new"
    get "sign_out", :to => "teachers/sessions#destroy" 
  end
  
  root to: "tops#index"
end
