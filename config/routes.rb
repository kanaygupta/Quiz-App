Rails.application.routes.draw do
  get 'questions/new'

  get 'quizzes/new'

  get 'subcategories/new'

  get 'categories/new'
  get 'categories/leaderboard/:id', to: 'categories#leaderboard', as: 'leadcat'
  get 'subcategories/leaderboard/:id', to: 'subcategories#leaderboard', as: 'leadsubcat'
  get 'quizzes/leaderboard/:id', to: 'quizzes#leaderboard',as: 'leadquiz'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  get  '/newcategory',  to: 'categories#new'
  get  '/newsubcategory',  to: 'subcategories#new'
  get  '/newquiz',  to: 'quizzes#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/view/:id',   to: 'users#view' , as: 'view'
  #post    '/users/:id',   to: 'users#update'

  get  '/play/:id',   to: 'games#play' , as: 'play'
  post  '/play/:id',   to: 'games#update' , as: 'update'


  resources :users
  resources :categories
  resources :subcategories
  resources :quizzes
  resources :questions
end

