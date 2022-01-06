Rails.application.routes.draw do

  devise_for :users

  root 'homes#top'
  get 'about' => 'homes#about'

  resources :users,only: [:show,:index,:edit,:update]

  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  post 'follow/:id' => 'relationships#create', as: 'follow'
  delete 'unfollow/:id' => 'relationships#destroy', as: 'unfollow'
  resources :users, only: :show

end
