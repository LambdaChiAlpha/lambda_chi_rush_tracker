Rails.application.routes.draw do
  root "rushees#index"

  resources :rushees do
    resources :notes
    collection do
      get :search
    end
  end

  resources :notes, only: [:create]
end
