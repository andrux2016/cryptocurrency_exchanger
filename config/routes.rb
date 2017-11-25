Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :my do
    resources :accounts
  end

  root to: 'static_pages#top'

  mount LetterOpenerWeb::Engine, at: "/emails" if Rails.env.development?
end
