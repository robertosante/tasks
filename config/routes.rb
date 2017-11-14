Rails.application.routes.draw do

  post 'authorize' => 'sessions#authenticate_user'

  resources :tasks

end
