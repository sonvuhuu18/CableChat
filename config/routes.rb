Rails.application.routes.draw do
  root "chat_rooms#index"
  devise_for :users
  resources :chat_rooms, except: [:edit, :update, :destroy]
  mount ActionCable.server => "/cable"
end
