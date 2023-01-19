Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  resources :quotes do
    resources :line_item_dates, except: [:show, :index] do
      resources :line_item, except: [:show, :index]
    end
  end
end
