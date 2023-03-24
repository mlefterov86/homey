Rails.application.routes.draw do
  root to: 'projects#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :projects, only: %w[index show update]
end
