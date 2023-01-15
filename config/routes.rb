Rails.application.routes.draw do
  get 'line_item_dates/new'
  get 'line_item_dates/create'
  get 'line_item_dates/edit'
  get 'line_item_dates/update'
  get 'line_item_dates/destroy'
  root to: "pages#home"
  devise_for :users
  resources :quotes do
    resources :line_item_dates, except: [:show, :index]
  end
end
