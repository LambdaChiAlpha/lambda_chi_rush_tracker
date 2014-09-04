Rails.application.routes.draw do
  root "rushees#index"

  resources :rushees do
    collection do
      get :search
    end
  end
end
