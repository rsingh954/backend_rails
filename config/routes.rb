Rails.application.routes.draw do
  match '/ping' => 'pings#index', via: :get
  resources :posts
end
