Rails.application.routes.draw do

  root 'homes#top'
  get 'about' => 'homes#about'
  get 'self' => 'homes#self'

  get 'search' => 'search#locate'

  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :users, path: '', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  namespace :admins do
    get '/' => 'homes#top'
    resources :posts
  end

  scope module: 'users' do
    resources :persons, only: [:show, :edit, :update, :destroy]
    resources :rooms, only: [:show, :index, :create]
    resources :messages, only: [:create]
    resources :events do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

end
