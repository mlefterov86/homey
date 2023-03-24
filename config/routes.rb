Rails.application.routes.draw do
  root to: 'projects#index'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :projects, only: %w[index show update] do
    member { get "versions", to: "projects#versions" }
  end
  resources :comments, only: %w[show create]
end
