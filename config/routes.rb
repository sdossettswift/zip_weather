Rails.application.routes.draw do
  resources :entries, only: [:new, :index, :create ]
  root 'entries#index'
  #post 'locate' => 'weather#locate', as: :locate
  #root 'weather#index'

end
