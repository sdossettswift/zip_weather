Rails.application.routes.draw do
  resources :entries

  post 'locate' => 'weather#locate', as: :locate
  root 'weather#index'

end
