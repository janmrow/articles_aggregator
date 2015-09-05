Rails.application.routes.draw do
  get 'pages/about'

  resources :articles do
    resources :comments
  end

  root 'articles#index'

  get '*path' => redirect('/')
end
