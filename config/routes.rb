Rails.application.routes.draw do

  post 'locate' => 'weather#locate', as: :locate
  root 'weather#index'

end
