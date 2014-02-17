Hospitalpricecompare::Application.routes.draw do
  resources :users do
    resources :favorites
  end

  resources :hospitals do
    collection do
      get "search"
    end
  end


  #resources :sessions, only: [:new, :create, :destroy]
  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  root "welcome#index"
end
