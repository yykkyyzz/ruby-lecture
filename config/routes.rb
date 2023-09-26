Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "boards#index"
  # get "boards", to: "boards#index"
  # get "boards/new", to: "boards#new"
  # post "boards", to: "boards#create"
  # get "boards/:id", to: "boards#show"
  # root "boards#index"

  # resources で基本的なアクションのルートが準備される
  resources :boards
  
  # onlyオプションで使用するルートパスだけ指定できる
  # resources :boards, only: %i[:index, :new, :create, :show, :edit, :update]
  resources :comments, only: %i[create destroy]

end
