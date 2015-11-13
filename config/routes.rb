Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'videos#index'
  #post 'videos/search', to: 'videos#search'
  resources :categories
  resources :videos do
    collection do
      post :search, to: 'videos#search'
    end
  end

end
