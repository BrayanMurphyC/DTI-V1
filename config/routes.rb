Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :documentos
  mount Ckeditor::Engine => '/ckeditor'
  resources :evento_ponentes
  resources :ponentes
  require 'sidekiq/web'

  devise_for :users

  devise_for :subscribers ,  controllers: { registrations: 'registrations' , sessions: 'sessions'}

  devise_scope :subscriber do
    get 'perfil', to: 'devise/registrations#edit'
  end

  get '/perfil/eventos' => 'perfil#index'

  mount Sidekiq::Web => '/sidekiq'

  resources :articulos

  resources :events

  resources :registro_eventos

  resources :events do
    resources :registro_eventos
  end

  resources :events do
    resources :evento_ponentes
  end

  resources :events do
    member do
      put "like", to: "events#upvote"
      put "dislike", to: "events#downvote"
    end
  end

  resources :articulos do
    member do
      put "like", to: "articulos#upvote"
      put "dislike", to: "articulos#downvote"
    end
  end

  root 'home#index'
  get 'home/index'
  get '/eventos' => 'events#index'
  get '/eventos/:id' => 'events#show'
  get '/oferta_tecnologica' => 'oferta#index'
  get '/emprendimiento' => 'emprendimiento#index'
  get '/propiedad_intelectual' => 'propiedad#index'
  get '/eventos/:event_id/inscripciones' => 'registro_eventos#index'


end
