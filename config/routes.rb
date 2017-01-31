Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    resources :companies, only: [:index]
  end

  root "static_pages#root"
end
