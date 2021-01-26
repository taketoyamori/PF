Rails.application.routes.draw do
  root 'homes#top'
  get 'about' => 'homes#about'
  get 'search' => 'search#locate'

  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admins/sessions',
  }

  devise_for :users, path: '', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }

  namespace :admins do
    get '/' => 'homes#top'
    resources :posts
    resources :managements, only: [:index, :destroy]
  end

  scope module: 'users' do
    resources :blogs, only: [:index, :show]
    resources :persons, only: [:show, :edit, :update, :destroy] do
      resource :relationships, only: [:create, :destroy]
    end
    resources :rooms, only: [:show, :index, :create] do
      resources :messages, only: [:create, :destroy]
    end
    resources :events do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
end
