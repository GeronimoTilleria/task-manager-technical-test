Rails.application.routes.draw do
  root "projects#index"

  # Solo habilitamos la vista del formulario y el envío de datos
  resources :clients, only: [:new, :create]

  resources :projects do
    resources :tasks, only: [:create, :update]
  end
end
