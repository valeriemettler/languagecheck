Languagecheck::Application.routes.draw do
  devise_for :users
  resources :users
  
  resources :languages do
    resources :questions, except: [:index] do 
      resources :answers
      post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
    end
   end

  resources :questions, only: [:index, :new, :create]
  #resources :comments
  
  get 'about' => 'welcome#about'
  root to: 'welcome#index' 
  end


