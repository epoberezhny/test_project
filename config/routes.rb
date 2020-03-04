Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: redirect('/tickets')
  resources :tickets, only: %i[index show]

  namespace :api do
    namespace :v1 do
      resources :tickets, only: %i[create]
    end
  end
end
